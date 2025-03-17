import 'package:flutter/material.dart';
import 'package:health_tracker/models/healthdata.dart';

class HealthItem extends StatelessWidget {
  const HealthItem(this.health, {super.key});

  final Healthdata health;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(health.title),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Icon(Icons.alarm),
                SizedBox(
                  width: 5,
                ),
                Text(health.hours.toStringAsFixed(2)),
                Spacer(),
                Row(
                  children: [
                    Icon(activityIcons[health.activity]),
                    SizedBox(width: 8),
                    Text(health.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
