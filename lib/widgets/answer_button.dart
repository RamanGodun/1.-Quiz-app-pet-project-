import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questionary/data/theme_data.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      color: getCupertinoTheme().primaryColor,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
      ),
    );
  }
}
