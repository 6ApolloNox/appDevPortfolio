import 'package:flutter/material.dart';

class TestquestionsSummary extends StatelessWidget {
  const TestquestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data){
        return Column(
          Text(da)
        )
      }).toList(),
    );
  }
}
