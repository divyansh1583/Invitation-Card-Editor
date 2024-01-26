// image_saver.dart

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageSaver {
  static Future<void> saveImage(ui.Image image) async {
    try {
      ByteData byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;
      Uint8List pngBytes = byteData.buffer.asUint8List();

      await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 100,
        name: 'invitation_card',
      );
      // Show a success message or any other user feedback here
      
    } catch (e) {
      // Handle errors or show an error message
      print(e.toString());
    }
  }
}
