import 'package:flutter/material.dart';

import 'quiz_over_page.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        // appBar: AppBar(title: Text('Quizzler App'),),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class QnA {
  String question;
  bool answer;
  String explanation;
  QnA(String question, bool answer, [String explanation]) {
    this.question = question;
    this.answer = answer;
    if (explanation != null) {
      this.explanation = explanation;
    } else {
      this.explanation = 'No explanation provided by system';
    }
  }
}

bool quizOver = false;

List<QnA> qnaList = [
  new QnA('The zodiac sign of Aquarius is represented by a tiger', false, 'The zodiac sign for Aquarious is a Water bearer'),
  new QnA('The unicorn is the national animal of Scotland', true),
  new QnA('"A" is the most common letter used in the English language', false, 'E is the most common letter'),
  new QnA('Monaco is the smallest country in the world', false, 'Its the Vatican'),
  new QnA('There are five different blood groups', false, 'There are four: A, B, AB, and O'),
  new QnA('Alaska is the biggest American state in square kilometers', true),
  new QnA('Utar Padesh is the largest state of India in square kilometers', false, 'Rajasthan is the largest state by area in India'),
  new QnA('Alexander Fleming discovered penicillin', true),
  new QnA('Jonas Edward Salk is credited with the firxt effective vaccine against Polio', true),
  new QnA('Your ' 'radius' ' bone is in your leg', false, 'Radius is one of the biggest bones in your forearm')
];
int trueScore = 0;
int falseScore = 0;

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int quizSize = qnaList.length;

  void nextQuestion() {
    this.questionIndex = (this.questionIndex + 1);
    if (this.questionIndex == quizSize) {
      this.questionIndex--;
      quizOver = true;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizOverPage(trueScore)),
      );
    }
  }

  void checkQuestion(bool answer) {
    (qnaList[questionIndex].answer == answer) ? trueScore++ : falseScore++;
  }

  void previousQuestion() {
    this.questionIndex--;
    if (this.questionIndex == -1) {
      this.questionIndex = this.quizSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '${qnaList[this.questionIndex].question}',
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
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  // When someone presses TRUE
                  this.checkQuestion(true);
                  this.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  this.checkQuestion(false);
                  this.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          // This is my score keeper
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  Text(
                    '${trueScore}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.close, color: Colors.red),
                  Text(
                    '${falseScore}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
