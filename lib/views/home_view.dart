import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/git_notes_cubit/notes_cubit.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton:
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true, context: context, builder: (context) {
              return AddNoteBottonSheet();
            },);
          },
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}

