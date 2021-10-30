import 'package:flutter/material.dart';

class QuizOverPage extends StatelessWidget {
  int trueScore;
  QuizOverPage(int trueScore) {
    this.trueScore = trueScore;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Text(
              'Congratulations, you have completed the quiz. You have scored ${this.trueScore * 100 / qnaList.length} percent. We have mailed you the results :)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
