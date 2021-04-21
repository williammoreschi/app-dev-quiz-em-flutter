import 'package:dev_quiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget()
        ),
      ),
      body: QuizWiget(title: "O que o Flutter faz em sua totalidade?",),
    );
  }
}