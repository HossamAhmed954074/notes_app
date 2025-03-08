import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'add_note_form.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: AddNotesForm(),
      ),
    );
  }
}




