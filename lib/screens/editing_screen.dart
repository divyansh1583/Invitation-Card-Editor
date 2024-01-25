import 'package:celebrate_app/model/text_model.dart';
import 'package:celebrate_app/widgets/addtext_button.dart';
import 'package:celebrate_app/widgets/tool_bar.dart';
import 'package:flutter/material.dart';

class EditingScreen extends StatefulWidget {
  const EditingScreen({super.key});

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  TextInfo currentText = TextInfo(
    text: 'Empty',
    left: 0,
    top: 0,
    fontSize: 20,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );
  void changeText(String newText) {
    setState(() {
      currentText.text = newText;
    });
  }

  void changeColor(Color newColor) {
    setState(() {
      currentText.color = newColor;
    });
  }

  void changeFontSize(double newFontSize) {
    setState(() {
      currentText.fontSize = newFontSize;
    });
  }

  void changeFontStyle(FontStyle newFontStyle) {
    setState(() {
      currentText.fontStyle = newFontStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invitation Card Editor'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('lib/assets/white_template.jpg'),
                    fit: BoxFit.cover),
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onBackground,
                  width: 2,
                ),
              ),
            ),
            Positioned(
              left: currentText.left,
              top: currentText.top,
              child: GestureDetector(
                onTap: () {
                  print('Text selected');
                },
                child: Draggable(
                  feedback: Text(
                    currentText.text,
                    style: TextStyle(
                      fontSize: currentText.fontSize,
                      color: currentText.color,
                    ),
                  ),
                  child: Text(currentText.text),
                  onDragEnd: (details) {
                    final RenderBox box =
                        context.findRenderObject() as RenderBox;
                    Offset offset = box.globalToLocal(details.offset);
                    setState(() {
                      currentText.top = offset.dy - 200;
                      currentText.left = offset.dx - 10;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddText(changeText: changeText),
      bottomNavigationBar: ToolBar(
        currentText: currentText,
        changeColor: changeColor,
        changeFontSize: changeFontSize,
        changeFontStyle: changeFontStyle,
      ),
    );
  }
}
