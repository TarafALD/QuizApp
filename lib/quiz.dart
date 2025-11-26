import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/startscreen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget {
 const Quiz({super.key});

 @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; //activescreen can be null -?-
   List<String> selectedAnswer = [];

@override
  void initState() {
    activeScreen = StartScreen(switchScreen, colors: [Color.fromARGB(255, 202, 182, 206), Colors.white]);
    super.initState();
  }
  void chosenAnswer(String answer){
  selectedAnswer.add(answer);

  if (selectedAnswer.length == questions.length) {
      setState(() {
            //  selectedAnswer= [];
              activeScreen=  ResultsScreen(selectedAnswer, restartQuiz,);
    
          });
    }
}
void switchScreen(){
  setState(() {
      activeScreen=  QuestionsScreen(chosenAnswer);


    });
}


@override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: activeScreen
        ),
      ),
    );
  }
}
