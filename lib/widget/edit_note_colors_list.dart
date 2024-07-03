import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widget/color_item.dart';

import '../constants.dart';
import '../cubit/add_note_cubit/add_notes_cubit.dart';

class EditNoteColorsList extends StatefulWidget {
  EditNoteColorsList({super.key, required this.note});
final NoteModel note ;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isActive: currentIndex == index,
            ),
          ),
        ),),
    );
  }
}
