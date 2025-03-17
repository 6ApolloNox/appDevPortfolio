import 'package:flutter/material.dart';
import 'package:flutter_test2/answer_button.dart';
import 'package:flutter_test2/data/questions.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _TestScreen();
  }
}

class _TestScreen extends State<TestScreen> {
  var presentQuestionIndex = 0;

  void answeredQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      presentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final questionNow = testQuestions[presentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(questionNow.question,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ...questionNow.listShuffled.map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answeredQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
