import 'package:flutter/material.dart';

class IsAnswerCorrectIdentifier extends StatelessWidget {
  const IsAnswerCorrectIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    final backgroundColor = isCorrectAnswer
        ? const Color.fromARGB(255, 5, 207, 35).withOpacity(0.7)
        : Theme.of(context).colorScheme.error.withOpacity(0.7);

    return Container(
      width: 40,
      height: 45,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          questionNumber.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
