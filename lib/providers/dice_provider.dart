import 'package:dices/constants.dart';

import 'package:flutter/material.dart';

class DiceProvider extends ChangeNotifier {
  Color _diceBackgroundColor = kDiceColors[0];
  Color _dotColor = Colors.black;

  Color get diceBackgroundColor => _diceBackgroundColor;

  set diceBackgroundColor(Color newValue) {
    _diceBackgroundColor = newValue;
    notifyListeners();
  }

  Color get dotColor => _dotColor;

  set dotColor(Color newValue) {
    _dotColor = newValue;
    notifyListeners();
  }
}
