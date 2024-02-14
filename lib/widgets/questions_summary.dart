import 'package:flutter/material.dart';
import 'summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: summaryData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 5),
          child: SummaryItem(summaryData[index]),
        );
      },
    );
  }
}
