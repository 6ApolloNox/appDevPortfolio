import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/health_list.dart';
import 'package:health_tracker/models/healthdata.dart';
import 'package:health_tracker/widgets/new_health.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HealthState();
  }
}

class _HealthState extends State<Health> {
  final List<Healthdata> _registeredHealth = [
    Healthdata(
        activity: Activity.sleep,
        title: 'Sleeping',
        date: DateTime.now(),
        hours: 4),
    Healthdata(
        activity: Activity.stepsCount,
        title: 'Running',
        date: DateTime.now(),
        hours: 1.5),
  ];

  void _openAddHealthOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewHealth(onAddHealth: _addHealth);
        });
  }

  void _addHealth(Healthdata health) {
    setState(() {
      _registeredHealth.add(health);
    });
  }

  void _removeHealth(Healthdata health) {
    final healthIndex = _registeredHealth.indexOf(health);
    setState(() {
      _registeredHealth.remove(health);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Expense Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredHealth.insert(healthIndex, health);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('Add Your Health Data'),
    );

    if (_registeredHealth.isNotEmpty) {
      mainContent = Expanded(
          child: HealthList(
              healthData: _registeredHealth, onRemoveHealth: _removeHealth));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Health Tracker!'), actions: [
        IconButton(onPressed: _openAddHealthOverlay, icon: Icon(Icons.add)),
      ]),
      body: Column(
        children: [
          const Text(
            'Health is wealth',
          ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
