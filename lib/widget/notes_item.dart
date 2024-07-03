import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubit/notes/notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note: note,),));
        },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: const TextStyle(color: Colors.black,fontSize: 26),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(note.subTitle,style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 16),),
              ),
              trailing: IconButton(onPressed: (){
                note.delete();

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              }, icon: const Icon(Icons.delete,color: Colors.black,size: 30,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(note.data,style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 10),),
            )
          ],
        ),
      ),
    );
  }
}
