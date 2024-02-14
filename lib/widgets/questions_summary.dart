import 'package:flutter/material.dart';
import 'summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
        itemCount: summaryData.length,
        itemBuilder: (context, index) {
          return SummaryItem(summaryData[index]);
        },
      ),
    );
  }
}
