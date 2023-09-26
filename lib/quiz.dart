import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen ='start_Screen';



void switchScreen() {
  setState(() {
    activeScreen = 'questions_Screen';
  });
}

void chooseAnswer(String answer)
{
  selectedAnswers.add(answer);

  if (selectedAnswers.length == questions.length)
  {
    setState(() {
      selectedAnswers=[];
      activeScreen='start-screen';
    });
  }
}

  @override
  Widget build(context) {
    Widget screenWidget =StartScreen(switchScreen);

    if(activeScreen =='question-screen')
    {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 70, 14, 167),
                  Color.fromARGB(255, 62, 38, 103),
                ],
                begin:Alignment.topLeft,
                end: Alignment.topRight,
              ),
              ),
              child: screenWidget,
        ),
      ),
    );
  }
}