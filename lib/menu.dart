import 'package:dices/screens/dices_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.diceSix),
            title: Text(AppLocalizations.of(context)!.dicesTitle),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DicesScreen()));
            },
          ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.trophy),
          //   title: const Text('DRAW'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => DrawScreen()));
          //   },
          // )
        ],
      ),
    );
  }
}
