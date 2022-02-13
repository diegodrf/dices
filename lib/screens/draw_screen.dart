import 'dart:developer';

import 'package:dices/components/draw/add_item_component.dart';
import 'package:dices/components/draw/list_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../menu.dart';

class DrawScreen extends StatefulWidget {
  static const String route = 'draw_screen';
  final String title = 'Draw';
  final List<String> _list = ['Diego', 'Camila'];

  DrawScreen({Key? key}) : super(key: key);

  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: const Menu(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new item to the list.',
        child: const Icon(FontAwesomeIcons.plus),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddItemComponent(onSubmit: (String text) {
                  setState(() {
                    widget._list.add(text);
                  });
                  Navigator.pop(context);
                });
              });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListComponent(
            list: widget._list,
          ),
          ElevatedButton(onPressed: (){}, child: Text('Draw'))
        ],
      ),
    );
  }
}
