import 'package:celebrate_app/model/fonts_list.dart';
import 'package:celebrate_app/model/text_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
    required this.currentText,
    required this.changeColor,
    required this.changeFontSize,
    required this.changeFontFamily,
  });
  final TextInfo currentText;
  final void Function(Color color) changeColor;
  final void Function(double fontSize) changeFontSize;
  final void Function(String fontFamily) changeFontFamily;

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
                  // print("Button Pressed");
                  // changeFontSize(33);
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
          label: 'Font Size',
        ),
        //Change Font Family
        BottomNavigationBarItem(
          icon: DropdownButton<String>(
            isExpanded: true,
            value: currentText.fontFamily,
            dropdownColor: Theme.of(context).colorScheme.onPrimary,
            onChanged: (String? newValue) {
              changeFontFamily(newValue!);
            },
            items: [
              for (String font in myGoogleFonts)
                DropdownMenuItem<String>(
                  value: font,
                  child: Text(
                    font,
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: GoogleFonts.getFont(font).fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
            ],
          ),
          label: '',
        ),
        //Change Color
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Change Color"),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: currentText.color,
                        onColorChanged: (color) {
                          changeColor(color);
                        },
                      ),
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
                          Navigator.of(context).pop();
                        },
                        child: const Text("Done"),
                      ),
                    ],
                  );
                },
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
