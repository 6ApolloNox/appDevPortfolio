import 'package:flutter/material.dart';
import 'package:health_tracker/health.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 7, 224, 155),
);

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimary,
            foregroundColor: kColorScheme.onPrimary)),
    home: Health(),
  ));
}
