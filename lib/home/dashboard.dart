import 'package:flutter/material.dart';
import 'package:gutech_llc/home/menu.dart';
import '../dashbords_widgets/dashboard_card.dart';
import '../dashbords_widgets/statistics_card.dart';
import '../dashbords_widgets/tabs_screen.dart';
import '../dashbords_widgets/todos_card.dart';


class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();  // Add a GlobalKey for the Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // Assign the GlobalKey to the Scaffold
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();  // Use the key to open the drawer
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SideMenu(),  // Call the SideMenu here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      icon: Icons.business_center,
                      label: "Total Projects",
                      count: 0,
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      icon: Icons.checklist,
                      label: "Total Tasks",
                      count: 0,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      icon: Icons.person,
                      label: "Total Users",
                      count: 12,
                      color: Colors.orange,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DashboardCard(
                      icon: Icons.group,
                      label: "Total Clients",
                      count: 0,
                      color: Colors.lightBlue,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  StatisticsCard(
                    title: "Project Statistics",
                    stats: ["Default", "In Progress", "Completed"],
                    count: [0, 0, 0],
                    color: [Colors.green, Colors.orange, Colors.red],
                  ),
                  SizedBox(height: 16),
                  StatisticsCard(
                    title: "Task Statistics",
                    stats: ["Default", "In Progress", "Completed"],
                    count: [0, 0, 0],
                    color: [Colors.green, Colors.orange, Colors.red],
                  ),
                  SizedBox(height: 16),
                  TodosCard(),
                ],
              ),
              SizedBox(height: 16),
              ListCalendarCard(),  // Call the TabsScreen here
            ],
          ),
        ),
      ),
    );
  }
}
