import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() { 
    super.initState();
    homeController.getUser();
    homeController.getQuizzes();
    homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if(homeController.state == HomeState.loading){
      return Scaffold(
        body: Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }else{  
      return Scaffold(
        appBar: AppBarWidget(user: homeController.user!,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: "Facíl"),
                    SizedBox(width: 5),
                    LevelButtonWidget(label: "Médio"),
                    SizedBox(width: 5),
                    LevelButtonWidget(label: "Difícil"),
                    SizedBox(width: 5),
                    LevelButtonWidget(label: "Períto")
                  ]
                ),
              ),
              SizedBox(height: 24),
              Expanded(child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: homeController.quizzes!.map((e) => 
                  QuizCardWidget(
                    title: e.title,
                    completed: "${e.questionAnswered}/${e.questions.length}",
                    percent: e.questionAnswered/e.questions.length,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ChallengePage(questions: e.questions)
                        )
                      );
                    }
                  )
                ).toList(),
              ))
            ],
          ),
        ),
      );
    }
  }
}