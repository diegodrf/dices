import 'package:flutter/material.dart';

class AddItemComponent extends StatefulWidget {
  final void Function(String) onSubmit;
  const AddItemComponent({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AddItemComponent> createState() => _AddItemComponentState();
}

class _AddItemComponentState extends State<AddItemComponent> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade600,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 15),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'New item',
              ),
              keyboardType: TextInputType.text,
              onChanged: (newValue) {
                text = newValue;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSubmit(text);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
