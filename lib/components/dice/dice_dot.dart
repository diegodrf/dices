import 'package:flutter/material.dart';

class DiceDotWidget extends StatelessWidget {
  final bool visible;
  final double dotSize;

  const DiceDotWidget({Key? key, this.visible = true, required this.dotSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        color: visible ? Colors.black : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
