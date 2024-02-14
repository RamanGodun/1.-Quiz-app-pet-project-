import 'package:flutter/material.dart';
import 'question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    final dividerWidget = Divider(
      thickness: 0.1,
      color: Theme.of(context).dividerColor,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        dividerWidget,
        Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: IsAnswerCorrectIdentifier(
                isCorrectAnswer: isCorrectAnswer,
                questionIndex: itemData['question_index'] as int,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(
                    context,
                    itemData['question'] as String,
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(height: 5),
                  _buildText(
                    context,
                    itemData['user_answer'] as String,
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                          fontSize: 13,
                        ),
                  ),
                  _buildText(
                    context,
                    itemData['correct_answer'] as String,
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 13,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        dividerWidget,
      ],
    );
  }

  Text _buildText(BuildContext context, String text, TextStyle? style) {
    return Text(
      text,
      style: style,
    );
  }
}
