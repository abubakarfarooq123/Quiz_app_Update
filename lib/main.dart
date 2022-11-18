import 'package:flutter/material.dart';
import 'package:untitled/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite Color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 3,
        },
        {
          'text': 'Elephant',
          'score': 11,
        },
        {
          'text': 'Snake',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 9,
        },
      ],
    },
    {
      'questionText': 'Who is your favorite Instructor?',
      'answers': [
        {
          'text': 'Angelina Yu',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 5,
        },
        {
          'text': 'Marcus',
          'score': 7,
        },
        {
          'text': 'Mathew',
          'score': 6,
        },
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore = _totalscore + score;
    // if (_questionIndex < questions.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Quiz App",
            ),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalscore, resetquiz),
        ));
  }
}
