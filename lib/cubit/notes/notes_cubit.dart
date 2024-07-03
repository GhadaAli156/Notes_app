 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/cubit/notes/notes_state.dart';

import '../../constants.dart';
import '../../model/note_model.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NoteInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async{

      var noteBox = Hive.box<NoteModel>(kNotesBox);
      notes = noteBox.values.toList();

      emit(NoteSuccess());
}

}