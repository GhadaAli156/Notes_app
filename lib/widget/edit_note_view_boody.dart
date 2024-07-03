import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubit/notes/notes_cubit.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widget/colors_list_view.dart';
import 'package:notesapp/widget/custom_app_bar.dart';
import 'package:notesapp/widget/custom_text_field.dart';
import 'package:notesapp/widget/edit_note_colors_list.dart';

class EditNoteViewBoody extends StatefulWidget {
  const EditNoteViewBoody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBoody> createState() => _EditNoteViewBoodyState();
}

class _EditNoteViewBoodyState extends State<EditNoteViewBoody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50,),
            CustomAppBar(
              onPressed: (){
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',icon: Icons.check,),
            SizedBox(height: 50,),
            CustomTextField(
              onChanged: (p0) {
                title=p0;
              },
                hint: widget.note.title),
            SizedBox(height: 16,),
            CustomTextField(
              onChanged: (p0) {
                content=p0;
              },
              hint: widget.note.subTitle,maxLines: 5,),

            EditNoteColorsList(note: widget.note,)
          ],
        ),
      ),
    );
  }
}
