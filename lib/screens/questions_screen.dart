import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/answer_button.dart';
import '../data/data_storage.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = qAnswers[currentQuestionIndex];

    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, bottom: 50, top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 130),
          Text(
            currentQuestion.text,
            style: CupertinoTheme.of(context)
                .textTheme
                .navLargeTitleTextStyle
                .copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...currentQuestion.shuffledAnswers.map((element) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AnswerButton(
                answerText: element,
                onTap: () {
                  answerQuestion(element);
                },
              ),
            );
          })
        ],
      ),
    );
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  //
}
