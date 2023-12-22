import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onAnswerPressed, {super.key});

  final Function() onAnswerPressed;
  final String answerText;
  void onPressed() {
    onAnswerPressed();
  }

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
