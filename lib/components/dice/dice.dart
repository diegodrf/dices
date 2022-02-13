import 'package:flutter/material.dart';

import 'generate_dots.dart';

class Dice extends StatelessWidget {
  final int diceValue;
  final double opacity;
  final double dotSize;

  const Dice({
    Key? key,
    required this.diceValue,
    required this.opacity,
    required this.dotSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        child: generateDots(diceValue, dotSize),
      ),
    );
  }
}
