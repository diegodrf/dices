import 'package:flutter/material.dart';

class ListItemComponent extends StatelessWidget {
  final String text;

  const ListItemComponent({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 5,
      ),
      child: Card(
        elevation: 8.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: 20,
          ),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
