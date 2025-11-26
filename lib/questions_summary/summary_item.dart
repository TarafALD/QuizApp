import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz/questions_summary/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer=
    itemData['user_answer']== itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        QuestionIdentifier(isCorrectAnswer: isCorrectAnswer, questionIndex: itemData['questionIndex'] as int,),
        const SizedBox(width: 20,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
            itemData['questions'] as String,
            style: GoogleFonts.chakraPetch(
              fontSize: 16,
              fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text(itemData['user_answer'] as String,
          style: const TextStyle(color:  Color.fromARGB(255, 168, 19, 19),)
          ), Text(itemData['correct_answer'] as String,
          style: const TextStyle(color: Color.fromARGB(255, 73, 182, 82))
          )]
        ))
      ]
    );
  }
}