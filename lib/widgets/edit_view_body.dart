import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/git_notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_color_item.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(
              title: 'Edit Notes',
              icon: Icons.done,
              onPressd: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                widget.noteModel.content = content ?? widget.noteModel.content;
                widget.noteModel.color= BlocProvider.of<AddNoteCubit>(context).color?.toARGB32() ?? widget.noteModel.color;
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 50),
            Column(
              children: [
                CustomTextField(
                  hint: widget.noteModel.title,
                  maxLine: 1,
                  onChanged: (val) => title = val,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hint: widget.noteModel.content,
                  maxLine: 5,
                  onChanged: (val) => content = val,
                ),
                SizedBox(height: 16),
                ColorsListView(color: widget.noteModel.color,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
