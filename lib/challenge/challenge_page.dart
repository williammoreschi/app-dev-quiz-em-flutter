import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionsMolel> questions;
  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengController();
  final pageController = PageController();
  @override
  void initState() { 
    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
    
  }

  void nextPage(){
    if(challengeController.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 10), 
        curve: Curves.linear
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(),
              IconButton(icon: Icon(Icons.close), onPressed: () { Navigator.pop(context); }),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier, 
                builder: (context,value,_) => QuestionIndicatorWidget(
                  currentPage: value,
                  quantity: widget.questions.length,
                )
              )
            ],
          )
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((e) => QuizWiget(
            question: e,
            onChange: nextPage
          )
        ).toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentPageNotifier,
            builder: (context,value,_) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(value < widget.questions.length)
                  Expanded(child: NextButtonWidget.white(
                    label: 'Pular',
                    onTap: nextPage
                    )
                  ),
                if(value == widget.questions.length)
                  Expanded(child: NextButtonWidget.darkGreen(
                    label: 'Confirmar',
                    onTap: () {
                      Navigator.pop(context);
                    }
                    )
                  ),
              ],
            ), 
          )
        ),
      ),
    );
  }
}