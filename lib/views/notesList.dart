import 'package:flutter/material.dart';
import 'package:note_vault_flutter/components/noteListItem.dart';
import 'package:note_vault_flutter/models/note.dart';
import 'package:note_vault_flutter/views/addNote.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final String _title = "Notes List";
  final List<Note> _notes = [
    const Note(1, "Note 1", "This is note 1 content."),
    const Note(2, "Note 2", "This is note 2 content."),
    const Note(3, "Note 3", "This is note 3 content."),
    const Note(4, "Note 4", "This is note 4 content."),
    const Note(5, "Note 5", "This is note 5 content."),
    const Note(6, "Note 6", "This is note 6 content."),
    const Note(7, "Note 7", "This is note 7 content."),
    const Note(8, "Note 8", "This is note 8 content."),
  ];

  void _addNewNote(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNote()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewNote(context),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return NotesListItem(note: _notes[index]);
        },
      ),
    );
  }
}
