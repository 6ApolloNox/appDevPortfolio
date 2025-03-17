import 'package:flutter/material.dart';
import 'package:health_tracker/models/healthdata.dart';
import 'package:health_tracker/widgets/health_item.dart';

class HealthList extends StatelessWidget {
  const HealthList(
      {required this.onRemoveHealth, required this.healthData, super.key});

  final List<Healthdata> healthData;
  final void Function(Healthdata health) onRemoveHealth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: healthData.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(healthData[index]),
        onDismissed: (direction) {
          onRemoveHealth(healthData[index]);
        },
        child: HealthItem(healthData[index]),
      ),
    );
  }
}
