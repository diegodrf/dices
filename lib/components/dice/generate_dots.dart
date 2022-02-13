import 'package:flutter/material.dart';

import 'dice_dot.dart';

Column generateDots(int value, double dotSize) {
  final Map<int, List<bool>> numbers = {
    1: [false, false, false, false, true, false, false, false, false],
    2: [true, false, false, false, false, false, false, false, true],
    3: [true, false, false, false, true, false, false, false, true],
    4: [true, false, true, false, false, false, true, false, true],
    5: [true, false, true, false, true, false, true, false, true],
    6: [true, false, true, true, false, true, true, false, true],
  };

  final List<Row> rows = [];

  for (int index = 0; index < 3; index++) {
    final List<DiceDotWidget> dots = List<DiceDotWidget>.generate(3, (index) {
      return DiceDotWidget(
        visible: numbers[value]!.removeAt(0),
        dotSize: dotSize,
      );
    });

    final Row row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dots,
    );

    rows.add(row);
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: rows,
  );
}
