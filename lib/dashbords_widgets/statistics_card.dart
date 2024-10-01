import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final List<String> stats;
  final List<int> count;
  final List<Color> color;

  const StatisticsCard({required this.title, required this.stats, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatisticsDetailScreen(statTitle: "Default Projects")),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 16, color: color[0]),
                          SizedBox(width: 8),
                          Text(stats[0]), // Default
                        ],
                      ),
                      Text(count[0].toString()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatisticsDetailScreen(statTitle: "In Progress Projects")),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 16, color: color[1]),
                          SizedBox(width: 8),
                          Text(stats[1]), // In Progress
                        ],
                      ),
                      Text(count[1].toString()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatisticsDetailScreen(statTitle: "Completed Projects")),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 16, color: color[2]),
                          SizedBox(width: 8),
                          Text(stats[2]), // Completed
                        ],
                      ),
                      Text(count[2].toString()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatisticsDetailScreen(statTitle: "Total Projects")),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.menu, size: 16, color: Colors.grey),
                          SizedBox(width: 8),
                          Text("Total"),
                        ],
                      ),
                      Text((count.reduce((a, b) => a + b)).toString()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsDetailScreen extends StatelessWidget {
  final String statTitle;

  const StatisticsDetailScreen({required this.statTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(statTitle),
      ),
      body: Center(
        child: Text(
          '$statTitle Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
