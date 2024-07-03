import 'package:flutter/material.dart';
import 'package:notesapp/widget/notes_list_view.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(title: 'Notes',icon: Icons.search,),
            SizedBox(height:642,child: NotesListView())
          ],
      ),
    );
  }

}