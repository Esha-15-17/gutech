import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final Color color;
  final VoidCallback onPressed;

  DashboardCard({
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 10),
              Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("$count", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("View More", style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
