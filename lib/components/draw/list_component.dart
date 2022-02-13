import 'package:dices/components/draw/list_item_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  final List<String> list;

  const ListComponent({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListItemComponent(text: list[index]);
        });
  }
}
