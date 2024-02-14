import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data_storage.dart';
import '../widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': qAnswers[i].text,
          'correct_answer': qAnswers[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = qAnswers.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        child: Column(
          children: [
            const Divider(),
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const SizedBox(height: 10),
            Expanded(
              child: QuestionsSummary(summaryData),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(
                  Icons.refresh,
                  color: CupertinoColors.systemCyan,
                ),
                label: Text(
                  'Restart Quiz!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: CupertinoColors.systemCyan,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
