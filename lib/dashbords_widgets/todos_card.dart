import 'package:flutter/material.dart';

class TodosCard extends StatelessWidget {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Todos Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.add, color: Colors.blue),
                    SizedBox(width: 8),
                    Icon(Icons.menu, color: Colors.blue),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Todos Not Found!",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
