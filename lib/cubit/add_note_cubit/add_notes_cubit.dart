
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubit/add_note_cubit/add_notes_state.dart';
import 'package:notesapp/model/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit() : super(AddNoteInitial());
  Color color=const Color(0xffD2AB99);

  addNote(NoteModel note) async{
    note.color=color.value;
    emit(AddNoteLoading());
    try{
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    }catch(e){
      emit(AddNoteFailure(error: e.toString()));
    }
  }
}