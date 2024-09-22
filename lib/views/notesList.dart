import 'package:flutter/material.dart';
import 'package:note_vault_flutter/components/noteListItem.dart';
import 'package:note_vault_flutter/database/databaseHelper.dart';
import 'package:note_vault_flutter/models/note.dart';
import 'package:note_vault_flutter/views/addNote.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final String _title = "Notes List";
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> _addNewNote(context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNote()));

    loadNotes();
  }

  void loadNotes() async {
    List<Map<String, dynamic>> notesData = await DatabaseHelper().getNotes();
    setState(() {
      _notes = notesData.map((note) => Note.fromMap(note)).toList();
    });
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
