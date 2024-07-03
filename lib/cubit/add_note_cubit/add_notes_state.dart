abstract class AddNotesState {}
class AddNoteInitial extends AddNotesState{}
class AddNoteLoading extends AddNotesState{}
class AddNoteSuccess extends AddNotesState{}
class AddNoteFailure extends AddNotesState{
  final String error;
  AddNoteFailure({required this.error});
}