import 'package:flutter/cupertino.dart';

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
      color: CupertinoColors.systemBlue.withOpacity(0.7),
      padding: const EdgeInsets.all(16.0),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
    );
  }
}
