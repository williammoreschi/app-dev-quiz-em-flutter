import 'package:dev_quiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWiget extends StatelessWidget {
  final String title;
  const QuizWiget({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title,style: AppTextStyles.heading),
          SizedBox(height: 24),
          AwnserWidget(
            title: "Possibilita a criação de aplicativos compilados não nativamente",
          ),
          AwnserWidget(
            title: "Kit de desenvolvimento de interface de usuário",
            isRight: true,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Acho que é uma marca de café do Himalaia",
            isRight: false,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Possibilita a criação de desktops que são muito incríveis",
          ),
        ],
      ),
    );
  }
}