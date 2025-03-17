import 'package:flutter/material.dart';
import 'package:health_tracker/models/healthdata.dart';

class NewHealth extends StatefulWidget {
  const NewHealth({required this.onAddHealth, super.key});

  final void Function(Healthdata health) onAddHealth;

  @override
  State<NewHealth> createState() {
    return _NewHealthState();
  }
}

class _NewHealthState extends State<NewHealth> {
  final _titleController = TextEditingController();
  final _hourController = TextEditingController();
  DateTime? _selectedDate;
  Activity _selectedActivity = Activity.sleep;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _hourController.dispose();
    super.dispose();
  }

  void _submitHealthData() {
    final enteredHour = double.tryParse(_hourController.text);
    final hourIsInvalid = enteredHour == null || enteredHour == 0;
    if (_titleController.text.trim().isEmpty ||
        hourIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Invalid Input'),
                content: Text('Add Valid Details'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('Done'))
                ],
              ));
      return;
    }
    widget.onAddHealth(Healthdata(
        activity: _selectedActivity,
        title: _titleController.text,
        date: _selectedDate!,
        hours: enteredHour));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: ListView(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _hourController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text('Hours')),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedActivity,
                  items: Activity.values.map((activity) {
                    return DropdownMenuItem(
                      value: activity,
                      child: Text(
                        activity.name.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedActivity = value;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: _submitHealthData, child: Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
