import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'note_service.dart'; // Import NoteService and NoteProvider

void main() {
  final container = ProviderContainer();
  final noteService = container.read(noteProvider.notifier);

  while (true) {
    print('\nNote Management System');
    print('1. Add a note');
    print('2. View all notes');
    print('3. Edit a note');
    print('4. Delete a note');
    print('5. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter note title:');
        String? title = stdin.readLineSync();
        print('Enter note content:');
        String? content = stdin.readLineSync();
        if (title != null && content != null && title.isNotEmpty) {
          noteService.addNote(title, content);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '2':
        noteService.viewNotes();
        break;

      case '3':
        print('Enter the index of the note to edit:');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          print('Enter new title:');
          String? newTitle = stdin.readLineSync();
          print('Enter new content:');
          String? newContent = stdin.readLineSync();
          if (newTitle != null && newContent != null) {
            noteService.editNote(index, newTitle, newContent);
          } else {
            print('Invalid input. Please try again.');
          }
        }
        break;

      case '4':
        print('Enter the index of the note to delete:');
        int? deleteIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (deleteIndex != null) {
          noteService.deleteNote(deleteIndex);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '5':
        print('Exiting the application...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}