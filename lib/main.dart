import 'package:dices/providers/dice_provider.dart';
import 'package:dices/screens/dices_screen.dart';
import 'package:dices/screens/draw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DicesApp());
}

class DicesApp extends StatelessWidget {
  const DicesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DiceProvider(),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR')
        ],
        initialRoute: DicesScreen.route,
        routes: {
          DicesScreen.route: (context) => const DicesScreen(),
          DrawScreen.route : (context) => DrawScreen()
        },
      ),
    );
  }
}
