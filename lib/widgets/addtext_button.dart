import 'package:flutter/material.dart';

class AddText extends StatefulWidget {
  const AddText({super.key, required this.changeText});
  final void Function(String text) changeText;
  @override
  State<AddText> createState() => _AddTextState();
}

class _AddTextState extends State<AddText> {
  final TextEditingController _textcontroller = TextEditingController();
  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add Text',
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add Text"),
              content: TextField(
                controller: _textcontroller,
                // keyboardType: TextInputType.text,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.changeText(_textcontroller.text);
                    _textcontroller.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add Text"),
                ),
              ],
            );
          },
        );
        return;
      },
    );
  }
}
