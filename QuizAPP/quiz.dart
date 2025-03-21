import 'package:flutter/material.dart';
import 'package:flutter_test2/data/questions.dart';
import 'package:flutter_test2/questions_screen.dart';
import 'package:flutter_test2/results_screen.dart';
import 'package:flutter_test2/start_screen.dart';
import 'package:flutter_test2/test_results.dart';
import 'package:flutter_test2/test_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void pickedAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == testQuestions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'test-results';
      });
    }
  }

  switchTestScreen() {
    setState(() {
      activeScreen = 'test-screen';
    });
  }

  void restartQuiz() {
    selectedAnswers = [];
    activeScreen = 'questions-screen';
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen, switchTestScreen);

    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen, switchTestScreen);
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'test-screen') {
      screenWidget = TestScreen(onSelectedAnswer: pickedAnswers);
    }

    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    if (activeScreen == 'test-results') {
      screenWidget = TestResults(pickedAnswers: selectedAnswers);
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.cyan],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: screenWidget,
      ),
    ));
  }
}
