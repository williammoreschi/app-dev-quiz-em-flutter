import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int quantity;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.quantity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Questão $currentPage", style: AppTextStyles.body),
            Text("de $quantity",  style: AppTextStyles.body)
          ],
        ),
        SizedBox(height: 16),
        ProgressIndicatorWidget(value: currentPage/quantity)
      ],),
    );
  }
}