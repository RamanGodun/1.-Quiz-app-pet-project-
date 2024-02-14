import 'package:flutter/cupertino.dart';
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
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 130),
          Text(
            currentQuestion.text,
            style: CupertinoTheme.of(context)
                .textTheme
                .navLargeTitleTextStyle
                .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
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
          // ListView.builder(
          //     itemCount: currentQuestion.shuffledAnswers.length,
          //     itemBuilder: (context, index) {
          //       final answer = currentQuestion.shuffledAnswers[index];
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 8.0),
          //         child: AnswerButton(
          //           answerText: answer,
          //           onTap: () {
          //             answerQuestion(answer);
          //           },
          //         ),
          //       );
          //     },
          //   ),
        ],
      ),
    );
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < qAnswers.length - 1) {
        currentQuestionIndex++;
      } else {
        // Ви можете взяти додаткові дії, якщо це останнє питання.
      }
    });
  }
}