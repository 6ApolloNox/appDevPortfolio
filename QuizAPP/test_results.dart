import 'package:flutter/material.dart';
import 'package:flutter_test2/data/questions.dart';
import 'package:flutter_test2/testquestions_summary.dart';

class TestResults extends StatefulWidget {
  const TestResults({super.key, required this.pickedAnswers});

  final List<String> pickedAnswers;

  List<Map<String, Object>> get shortSummary {
    final List<Map<String, Object>> summary = [];

    for (var n = 0; n < pickedAnswers.length; n++) {
      summary.add({
        'question_index': n,
        'test_questions': testQuestions[n].question,
        'correct_answer': testQuestions[n].answers[0],
        'user_answer': pickedAnswers[n]
      });
    }
    return summary;
  }

  @override
  State<StatefulWidget> createState() {
    return _TestResults();
  }
}

class _TestResults extends State<TestResults> {
  @override
  Widget build(BuildContext context) {
    final summaryData = widget.shortSummary;
    final totalTestQuestions = testQuestions.length;
    final rightAnswers = 

    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Test Finished !'),
              const SizedBox(height: 20),
              Text('You answered correct answers: of $totalTestQuestions'),
              const SizedBox(height: 20),
              CircularProgressIndicator(
                strokeWidth: 6,
                value: totalTestQuestions,
                color: Colors.amberAccent,
                backgroundColor: Colors.white,
              )
            ],
          )),
    );
  }
}
