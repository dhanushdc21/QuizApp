import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuestionsScreen extends StatefulWidget {
   const QuestionsScreen({super.key,
   required this.onSelectAnswer,
   });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
var currrentQuestionIndex = 0;

void answerQuestion(String selectedAnswers) {
  widget.onSelectAnswer(selectedAnswers);
  setState(() {
     currrentQuestionIndex++; 
  });
}

  @override
  Widget build(context) {
    final currentQuestion = questions[currrentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:  const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
           Text(
            currentQuestion.text,
           style:GoogleFonts.lato(  
            color: const Color.fromARGB(255, 149, 110, 211),
            fontSize: 25,
            fontWeight: FontWeight.bold,
           ) ,
            textAlign: TextAlign.center,
           ),
           const SizedBox(height: 30),
           ...currentQuestion.gatShuffledAnswers().map((answer) { // Map converts a list to a widget, it doesnt change the original list but creates a copy
            return AnswerButton(
              answerText: answer, 
            ontap: () {
              answerQuestion(answer);
            },
            );
             //the three dots "..." is an inbuit function that is used to take out the individual elements from the list(which is holding another lsit within itself hence gives an error) and store it as separate items
  }),
          
          ],
        ),
      ),
    );
  }
}
