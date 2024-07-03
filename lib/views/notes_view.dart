import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubit/notes/notes_cubit.dart';
import 'package:notesapp/cubit/notes/notes_state.dart';
import 'package:notesapp/widget/add_note_bottom_sheet.dart';
import 'package:notesapp/widget/notes_item.dart';
import 'package:notesapp/widget/notes_view_body.dart';

class NotesView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
          context: context, builder: (context) {
          return const AddNoteBottomSheet();
        },);
      },
        child: Icon(Icons.add),),
      body: Column(
        children: [
          NotesViewBody(),
        ],
      ),
    );
  }

}