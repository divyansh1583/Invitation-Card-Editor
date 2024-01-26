import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,\n'
              'This invitation editor app currently allows only one text to be added, '
              'but can be changed to many in the future.\n'
              'Also, the feature of choosing a template can be added in the future.\n'
              'I did not add these features right now as I wasn\'t sure of the deadline '
              'and did whatever I could as fast as I can.\n\n'
              'I enjoyed this project very much as many things were new to me, especially '
              'the undo-redo part. It took a lot of time.\n\n'
              'Thank you for your time and consideration.\n\n'
              'Best Regards,\n'
              'Divyansh Chauhan\n'
              'divyanshchauhan28@gmail.com',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            )
          ],
        ),
      ),
    );
  }
}
