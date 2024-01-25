import 'package:celebrate_app/model/text_model.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
    required this.currentText,
    required this.changeColor,
    required this.changeFontSize,
    required this.changeFontStyle,
  });
  final TextInfo currentText;
  final void Function(Color color) changeColor;
  final void Function(double fontSize) changeFontSize;
  final void Function(FontStyle fontStyle) changeFontStyle;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      items: [
        //Font Size
        BottomNavigationBarItem(
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Increase Font Size
              IconButton(
                onPressed: () {
                  changeFontSize(currentText.fontSize + 1);
                },
                icon: const Icon(Icons.add),
              ),
              const SizedBox(width: 15),
              //Decrease Font Size
              IconButton(
                onPressed: () {
                  changeFontSize(currentText.fontSize - 1);
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          label: '',
        ),
        //Change Font Family
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.font_download),
          ),
          label: 'Font',
          tooltip: 'FontFamily',
        ),
        //Change Color
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              DropdownButton<Color>(
                value: currentText.color,
                onChanged: (Color? newColor) {
                  if (newColor != null) {
                    changeColor(newColor);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Colors.black,
                    child: Text('Black'),
                  ),
                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text('Red'),
                  ),
                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text('Green'),
                  ),
                  DropdownMenuItem(
                    value: Colors.blue,
                    child: Text('Blue'),
                  ),
                  DropdownMenuItem(
                    value: Colors.yellow,
                    child: Text('Yellow'),
                  ),
                  DropdownMenuItem(
                    value: Colors.purple,
                    child: Text('Purple'),
                  ),
                  DropdownMenuItem(
                    value: Colors.orange,
                    child: Text('Orange'),
                  ),
                  DropdownMenuItem(
                    value: Colors.pink,
                    child: Text('Pink'),
                  ),
                  DropdownMenuItem(
                    value: Colors.brown,
                    child: Text('Brown'),
                  ),
                  DropdownMenuItem(
                    value: Colors.grey,
                    child: Text('Grey'),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.color_lens),
          ),
          label: 'Color',
        )
      ],
    );
  }
}
