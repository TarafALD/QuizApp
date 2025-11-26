import 'package:flutter/material.dart';
import 'package:quiz/questions_summary/questions_identifier.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary( this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
 


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            final isCorrect = data['user_answer'] == data['correct_answer'];
 
            return Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(
                  questionIndex: data['question_index'] as int,
                  isCorrectAnswer: isCorrect,
                ),

                const SizedBox(width: 20),
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(data['question'] as String,
                   style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                       ),
                      ),
                  SizedBox(height: 5,),
                  Text("Correct answer: ${data['correct_answer']}"),
                  Text("Your answer: ${data['user_answer']}"),
                  const SizedBox(height: 20),
                ],),
              )
            ]);
        }).toList(),
        ),
      ),
    );
  }
}