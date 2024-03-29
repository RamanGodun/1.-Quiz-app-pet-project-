import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/theme_data.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    ///
    final primaryColor =
        CupertinoTheme.of(context).primaryColor.withOpacity(0.8);
    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return CupertinoPageScaffold(
      backgroundColor: kDarkTheme.canvasColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                color: primaryColor,
              ),
              const SizedBox(height: 70),
              Text(
                'Are u ready to test your knowledge?',
                textAlign: TextAlign.center,
                style: _buildTextStyle(context),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: startQuiz,
                  padding: const EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.play_arrow, color: onPrimaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Of course',
                        style: _buildButtonTextStyle(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    return getCupertinoTheme().textTheme.textStyle.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: getCupertinoTheme().primaryContrastingColor,
        );
  }

  TextStyle _buildButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w800,
            ) ??
        const TextStyle();
  }
}
