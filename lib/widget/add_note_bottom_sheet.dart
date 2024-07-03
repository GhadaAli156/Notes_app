import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubit/add_note_cubit/add_notes_cubit.dart';
import 'package:notesapp/cubit/notes/notes_cubit.dart';
import 'package:notesapp/widget/custom_button.dart';
import 'package:notesapp/widget/custom_text_field.dart';

import '../cubit/add_note_cubit/add_notes_state.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit,AddNotesState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
                padding:  EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child:  const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
          listener: (context, state) {
          if(state is AddNoteFailure){print('Faild ${state.error}');}
          if(state is AddNoteSuccess){
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);}
          },
          ),
    );
  }
}

