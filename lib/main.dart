import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green',
  ];

  List<bool> answers = [
    false,
    true,
    true,
  ];

  Question q1 = Question(
      q: 'You can lead a cow down stairs but not up stairs.', a: false);

  Question q2 = Question(
      q: 'Approximately one quarter of human bones are in the feet.', a: true);

  Question q3 = Question(q: 'A slug\'s blood is green', a: true);

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  bool correctAns = answers[questionNumber];
                  if (correctAns == true) {
                    print('got it right!!');
                  } else {
                    print('got it wrong!!');
                  }
                  setState(() {
                    questionNumber++;
                    print(questionNumber);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  bool correctAns = answers[questionNumber];
                  if (correctAns == false) {
                    print('got it right!!');
                  } else {
                    print('got it wrong!!');
                  }
                  setState(() {
                    questionNumber++;
                    print(questionNumber);
                  });
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
