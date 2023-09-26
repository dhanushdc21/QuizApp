import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
 const AnswerButton({
  super.key, 
  required this.answerText,
  required this.ontap,
  });

final String answerText;
final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              backgroundColor: const Color.fromARGB(255, 32, 3, 87),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            ),
            child: Text(answerText, textAlign: TextAlign.center,),
          );
  }
}