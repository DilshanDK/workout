import 'package:flutter/material.dart';
import 'package:myapp/util/colors.dart';

class ProgressCard extends StatefulWidget {
  const ProgressCard({super.key, required this.pValue});
  final double pValue;
  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [kGradientTopColor, kGradientBottomColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proteins, Fats,Water &\nCarbohydrates.",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: kMainWhiteColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20),
                minHeight: 20,
                backgroundColor: kGradientBottomColor,
                color: kMainWhiteColor,
                value: widget.pValue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnData("Done", ((widget.pValue * 100).toInt()).toString()),
                _columnData("Total", "100"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _columnData(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kMainWhiteColor),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kMainWhiteColor),
        ),
      ],
    );
  }
}
