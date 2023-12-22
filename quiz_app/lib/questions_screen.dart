import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/box_container.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currIndex = 0;
  void onPressed() {
    setState(() {
      currIndex++;
    });
    print('pressed');
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const MyBoxContainer(30),
            ...currentQuestion.getShuffledAnswers().map(
                  (item) => AnswerButton(item, onPressed),
                ),
          ],
        ),
      ),
    );
  }
}
