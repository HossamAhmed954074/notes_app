import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import '../models/note_model.dart';
import '../cubits/git_notes_cubit/notes_cubit.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        List<NoteModel> list =
            BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                //todo: this secthion to delete note item
                child: SwipeActionCell(
                  key: ObjectKey(list[index]),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                      backgroundRadius: 16,
                      widthSpace: 60,
                      performsFirstActionWithFullSwipe: true,
                      title: "delete",
                      icon: Icon(Icons.delete),
                      onTap: (CompletionHandler handler) {
                        list[index].delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      color: Colors.red,
                    ),
                  ],
                  child: NoteItem(noteItem: list[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
