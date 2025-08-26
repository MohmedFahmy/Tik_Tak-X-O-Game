import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String result;
  final Color winnerColor;

  const ResultText({super.key, required this.result, required this.winnerColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      result.toUpperCase(),
      style:  TextStyle(fontSize: 40, color: winnerColor),
      textAlign: TextAlign.center,
    );
  }
}
