import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 32),
            CustomTextField(hint: 'Title'),
            SizedBox(height: 20),
            CustomTextField(hint: 'Content', maxLine: 5),
            SizedBox(height: 24,),
            CustomButton(text: 'Add',),
            SizedBox(height: 32,),
          ],
        ),
      ),
    );
  }
}


