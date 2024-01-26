import 'package:celebrate_app/model/text_model.dart';
import 'package:celebrate_app/screens/info_screen.dart';
import 'package:celebrate_app/widgets/addtext_button.dart';
import 'package:celebrate_app/widgets/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:celebrate_app/widgets/image_saver.dart';
import 'dart:ui' as ui;

class EditingScreen extends StatefulWidget {
  const EditingScreen({super.key});

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  final TextInfo _currentText = TextInfo(
    text: 'Empty',
    left: 0,
    top: 0,
    fontSize: 33,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );
  final List<TextInfo> _history = [];
  int _historyIndex = -1;

  TextInfo get currentText => _currentText;

  final GlobalKey globalKey = GlobalKey();

  void changeText(String newText) {
    setState(() {
      _currentText.text = newText;
      _addToHistory();
    });
  }

  void changeColor(Color newColor) {
    setState(() {
      _currentText.color = newColor;
      _addToHistory();
    });
  }

  void changeFontSize(double newFontSize) {
    setState(() {
      _currentText.fontSize = newFontSize;
      _addToHistory();
    });
  }

  void changeFontFamily(String newFontFamily) {
    setState(() {
      _currentText.fontFamily = newFontFamily;
      _addToHistory();
    });
  }

  void _addToHistory() {
    if (_historyIndex < _history.length - 1) {
      // If we are not at the latest change, discard changes after _historyIndex
      _history.removeRange(_historyIndex + 1, _history.length);
    }
    _history.add(_currentText.copyWith()); // Add a copy of the current state
    _historyIndex = _history.length - 1;
  }

  void _undo() {
    if (_historyIndex > 0) {
      setState(() {
        _historyIndex--;
        _currentText.setValues(_history[_historyIndex]);
      });
    }
  }

  void _redo() {
    if (_historyIndex < _history.length - 1) {
      setState(() {
        _historyIndex++;
        _currentText.setValues(_history[_historyIndex]);
      });
    }
  }

  Future<void> _saveImage() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage();
      await ImageSaver.saveImage(image);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image stored successfully'),
        ),
      );
    } catch (e) {
      // Handle errors or show an error message
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image could not be stored'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invitation Card Editor'),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _saveImage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InfoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: RepaintBoundary(
          key: globalKey,
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
                    child: Text(
                      currentText.text,
                      style: TextStyle(
                        fontStyle: _currentText.fontStyle,
                        fontSize: _currentText.fontSize,
                        color: _currentText.color,
                        fontFamily: GoogleFonts.getFont(currentText.fontFamily)
                            .fontFamily,
                      ),
                    ),
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
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 33),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _undo();
              });
            },
            tooltip: 'Undo',
            child: const Icon(Icons.undo),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _redo();
              });
            },
            tooltip: 'Redo',
            child: const Icon(Icons.redo),
          ),
          const Spacer(),
          AddText(changeText: changeText),
        ],
      ),
      bottomNavigationBar: ToolBar(
        currentText: currentText,
        changeColor: changeColor,
        changeFontSize: changeFontSize,
        changeFontFamily: changeFontFamily,
      ),
    );
  }
}
