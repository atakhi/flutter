import 'package:flutter/material.dart';
import 'package:quiz_app/box_container.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  onPressed() {
    startQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(166, 255, 255, 255),
          ),
          const MyBoxContainer(50),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white),
          ),
          const MyBoxContainer(30),
          OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
