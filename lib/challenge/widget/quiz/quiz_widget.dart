import 'package:dev_quiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWiget extends StatefulWidget {
  final QuestionsMolel question;
  final VoidCallback onChange;
  const QuizWiget({
    Key? key,
    required this.question,
    required this.onChange
    }) : super(key: key);

  @override
  _QuizWigetState createState() => _QuizWigetState();
}

class _QuizWigetState extends State<QuizWiget> {
  int indexSelected = -1;

  AnswerModel awnser(int index) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 34),
          Text(
            widget.question.title,
            style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                .then((value) => 
                  widget.onChange()
                );
              }
            ),
          //...widget.question.answers.map((e) => AwnserWidget(
          //    title: e.title,
          //    isRight: e.isRight,
          //  ),
          //).toList(),
        ],
      ),
    );
  }
}