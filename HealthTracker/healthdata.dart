import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Activity {
  sleep,
  stepsCount,
  goalsAcieved,
}

const activityIcons = {
  Activity.sleep: Icons.bed,
  Activity.stepsCount: Icons.run_circle,
  Activity.goalsAcieved: Icons.task
};

class Healthdata {
  Healthdata(
      {required this.activity,
      required this.title,
      required this.date,
      required this.hours})
      : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double hours;
  final Activity activity;

  String get formattedDate {
    return formatter.format(date);
  }
}
