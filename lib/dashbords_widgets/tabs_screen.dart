import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ListCalendarCard extends StatefulWidget {
  @override
  _ListCalendarCardState createState() => _ListCalendarCardState();
}

class _ListCalendarCardState extends State<ListCalendarCard> with TickerProviderStateMixin {
  late TabController _secondTabController; // For List, Calendar tabs
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _secondTabController = TabController(length: 2, vsync: this); // 2 tabs for List and Calendar
  }

  @override
  void dispose() {
    _secondTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _secondTabController,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'List'),
                Tab(text: 'Calendar'),
              ],
            ),
            SizedBox(
              height: 400, // Define height for TabBarView
              child: TabBarView(
                controller: _secondTabController,
                children: [
                  // List View Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your DOB Is Not Set, Click Here to Set It Now.",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Icon(Icons.close, color: Colors.blue),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text("Select Member"),
                              items: <String>['Member 1', 'Member 2', 'Member 3'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Till Upcoming Days: Default 30",
                                suffixIcon: Icon(Icons.filter_alt, color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Delete Selected Will Delete Selected Team Members.",
                        style: TextStyle(color: Colors.blue[200]),
                      ),
                      Icon(Icons.close, color: Colors.blue[200]),
                      SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: constraints.maxWidth),
                              child: DataTable(
                                columns: [
                                  DataColumn(label: Text("ID")),
                                  DataColumn(label: Text("Member")),
                                  DataColumn(label: Text("Birth Day Date")),
                                  DataColumn(label: Text("Days Left")),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text("1")),
                                    DataCell(Text("John Doe")),
                                    DataCell(Text("12/08/1990")),
                                    DataCell(Text("15")),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text("2")),
                                    DataCell(Text("Jane Smith")),
                                    DataCell(Text("07/12/1985")),
                                    DataCell(Text("10")),
                                  ]),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  // Calendar View
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
