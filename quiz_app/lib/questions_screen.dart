import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/box_container.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currIndex = 0;
  void onPressed(String answer) {
    widget.onSelectAnswer(answer);
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
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const MyBoxContainer(30),
            ...currentQuestion.getShuffledAnswers().map(
                  (item) => AnswerButton(item, () {
                    onPressed(item);
                  }),
                ),
          ],
        ),
      ),
    );
  }
}
