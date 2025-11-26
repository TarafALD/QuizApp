import 'package:flutter/material.dart';
import 'package:quiz/StyledText.dart';



class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key, required this.colors});

  final void Function() startQuiz;

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
      child:Center(
        child:Column(
        mainAxisSize: MainAxisSize.min,
        children:[ Image.asset('images/img.png', width:300 ),const StyledText("Learn Flutter The Fun Way!" ),
        const SizedBox(height: 30,),
         OutlinedButton.icon(onPressed: (){ startQuiz();},
          label:Text('Start')), 
   ])));
  }
}
