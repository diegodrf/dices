import 'package:dices/providers/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceDotWidget extends StatelessWidget {
  final bool visible;
  final double dotSize;

  const DiceDotWidget({Key? key, this.visible = true, required this.dotSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        color: visible
            ? Provider.of<DiceProvider>(context).dotColor
            : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
