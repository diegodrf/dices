import 'package:dices/constants.dart';
import 'package:dices/providers/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiceSettings extends StatelessWidget {
  const DiceSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          height: 300,
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.diceBackgroundColorQuestion),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: kDiceColors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorSelection(
                      color: kDiceColors[index],
                      onSelected: () {
                        provider.diceBackgroundColor = kDiceColors[index];
                      },
                    );
                  },
                ),
              ),
              Text(AppLocalizations.of(context)!.diceDotColorQuestion),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: kDiceColors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorSelection(
                      color: kDiceColors[index],
                      onSelected: () {
                        provider.dotColor = kDiceColors[index];
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ColorSelection extends StatelessWidget {
  final Color color;
  final VoidCallback onSelected;

  const ColorSelection({
    Key? key,
    required this.color,
    required this.onSelected,
  }) : super(key: key);
  final double size = 32.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        height: size,
        width: size,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, width: 2.0
          ),
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
