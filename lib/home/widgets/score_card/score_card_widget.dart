import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/chart/chart.widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child:ChartWidget()
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "Vamos Começar",
                    style: AppTextStyles.heading,
                  ),
                  Text(
                    "Complete os desafios e avance em conheimento",
                    style: AppTextStyles.body,
                  )
                ],),
              ),
            )
          ],),
        ),
      ),
    );
  }
}