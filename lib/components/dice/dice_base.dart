import 'dart:math';

import 'package:dices/providers/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dice.dart';

class DiceBaseWidget extends StatefulWidget {
  const DiceBaseWidget({Key? key}) : super(key: key);

  @override
  State<DiceBaseWidget> createState() => _DiceBaseWidgetState();
}

class _DiceBaseWidgetState extends State<DiceBaseWidget>
    with SingleTickerProviderStateMixin {
  int _diceValue = 1;
  double _opacity = 1.0;
  late final AnimationController _animationController;
  late final Animation _dotAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _dotAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );

    _dotAnimation.addListener(() {
      setState(() {
        _opacity = _dotAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void rollDice() async {
      await _animationController.reverse(from: 1.0);
      setState(() {
        _diceValue = Random().nextInt(6) + 1;
      });
      await _animationController.forward(from: 0.0);
    }

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final double diceSize;
        final double dotSize;
        final double margin;
        if (orientation == Orientation.portrait) {
          diceSize = size.width * 0.45;
          dotSize = size.width * 0.08;
          margin = size.width * 0.03;
        } else {
          diceSize = size.height * 0.75;
          dotSize = size.height * 0.08;
          margin = size.height * 0.1;
        }
        return Consumer<DiceProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return GestureDetector(
              onTap: () => rollDice(),
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: margin,
                  ),
                  width: diceSize,
                  height: diceSize,
                  decoration: BoxDecoration(
                    color: provider.diceBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Dice(
                    diceValue: _diceValue,
                    opacity: _opacity,
                    dotSize: dotSize,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
