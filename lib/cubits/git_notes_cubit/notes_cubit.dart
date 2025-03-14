import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import '../../models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()){
    fetchAllNotes();
  }
  List<NoteModel>? notesList ;
  fetchAllNotes()  {
      var noteBox = Hive.box<NoteModel>(KNotesBox);
      notesList = noteBox.values.toList();
      emit(NotesSuccess());



  }
}
