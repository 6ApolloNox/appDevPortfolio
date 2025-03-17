import 'package:flutter_test2/models/quiz_question.dart';
import 'package:flutter_test2/models/testquiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

const testQuestions = [
  TestquizQuestion(
      'The HCF of two numbers is 12 and their sum is 288. How many pairs of such numbers are possible?',
      ['4', '8', '6', '14']),
  TestquizQuestion(
      'Find the lowest number which gives a remainder of 5 when divided by any of the numbers 6, 7, and 8.',
      ['173', '168', '178', '188']),
  TestquizQuestion(
      'The numbers 2604, 1020 and 4812 when divided by a number N give the same remainder of 12. Find the highest such number N.',
      ['48', '62', '36', '38']),
  TestquizQuestion(
      'A number when divided by 3, 4, 5, and 6 always leaves a remainder of 2, but leaves no remainder when divided by 7. What is the lowest such number possible?',
      ['182', '180', '178', '188']),
  TestquizQuestion(
      'How many 3-digit numbers are there, for which the product of their digits is more than 2 but less than 7?',
      ['21', '34', '30', '26'])
];
