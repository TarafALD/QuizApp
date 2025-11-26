import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions_summary.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, {super.key});

   final List<String> chosenAnswers;

  List <Map<String, Object>> getSummaryData(){

    final List<Map<String, Object>> summary =[];

    for (var i=0; i<chosenAnswers.length; i++){
      summary.add({'question_index': i,
                   'question': questions[i].text,
                   'correct_answer': questions[i].answers[0],
                   'user_answer': chosenAnswers[i]
                   });
                }     


    return summary;
  }

   //final void Function() restartQuiz;
   

  @override
  Widget build(BuildContext context) {
    final summaryData= getSummaryData();
    final numTotalQ= questions.length;
    final numCorrectQ=summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('you answered $numCorrectQ out of $numTotalQ questions correctly!',
              style:GoogleFonts.chakraPetch(
              fontSize: 20,
              fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              QuestionsSummary(getSummaryData()),
              SizedBox(height: 30,),
              TextButton(onPressed: (){}, child: Text('Restart Quiz!'))
        ],)
      ),
    ); 
  }

}