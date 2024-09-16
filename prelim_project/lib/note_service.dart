import 'package:riverpod/riverpod.dart';
import 'note.dart';

// NoteService with Riverpod's StateNotifier
class NoteService extends StateNotifier<List<Note>> {
  NoteService() : super([]);

  void addNote(String title, String content) {
    state = [...state, Note(title: title, content: content)];
  }

  void editNote(int index, String newTitle, String newContent) {
    if (index >= 0 && index < state.length) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            Note(title: newTitle, content: newContent)
          else
            state[i]
      ];
    }
  }

  void deleteNote(int index) {
    state = state.where((note) => state.indexOf(note) != index).toList();
  }

  void viewNotes() {
    if (state.isEmpty) {
      print('No notes available.');
    } else {
      for (int i = 0; i < state.length; i++) {
        print('$i: ${state[i]}');
      }
    }
  }
}

// Provider setup
final noteProvider = StateNotifierProvider<NoteService, List<Note>>((ref) {
  return NoteService();
});
