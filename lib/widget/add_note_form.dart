import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/cubit/add_note_cubit/add_notes_state.dart';
import 'package:notesapp/model/note_model.dart';
import 'package:notesapp/widget/color_item.dart';
import 'package:notesapp/widget/colors_list_view.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child:  Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (p0) {
              title = p0;
          },
            hint: 'Title',),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (p0) {
              subTitle=p0;
            },
            hint: 'Content',maxLines: 5,),
          const SizedBox(height: 32,),
          const ColorsListView(),

          const SizedBox(height: 32,),
          BlocBuilder<AddNotesCubit,AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();

                    var currentData = DateTime.now();
                    //var formattedCurrentData = DateFormat.yMd().format(currentData);
                    var formattedCurrentData = DateFormat('dd-mm-yyyy').format(currentData);

                    var noteModel = NoteModel(title: title!, subTitle: subTitle!, data: formattedCurrentData, color: Colors.green.value);
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  }else{
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {});
                  }
                },);
            },

          ),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}
