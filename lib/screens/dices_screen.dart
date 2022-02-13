import 'package:dices/components/dice/dice_settings.dart';
import 'package:flutter/material.dart';
import '../components/dice/dice_base.dart';
import '../menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DicesScreen extends StatefulWidget {
  static const String route = 'dices_screen';

  const DicesScreen({Key? key}) : super(key: key);

  @override
  _DicesScreenState createState() => _DicesScreenState();
}

class _DicesScreenState extends State<DicesScreen> {
  @override
  Widget build(BuildContext context) {
    final String title = AppLocalizations.of(context)!.dicesTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.settings),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const DiceSettings();
                },
              );
            },
          ),
        ],
      ),
      drawer: const Menu(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Flexible(child: DiceBaseWidget()),
            Flexible(child: DiceBaseWidget()),
          ],
        ),
      ),
    );
  }
}
