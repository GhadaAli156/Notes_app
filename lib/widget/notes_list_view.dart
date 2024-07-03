import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubit/notes/notes_cubit.dart';
import 'package:notesapp/cubit/notes/notes_state.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widget/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(

      builder: (context, state){
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes??[];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NotesItem(
                    note: notes[index],
                  ),
                );
              } ,),
          );
    },
    );
  }
}
