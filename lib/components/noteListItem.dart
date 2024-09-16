import 'package:flutter/material.dart';
import 'package:note_vault_flutter/models/note.dart';
import 'package:note_vault_flutter/views/openNote.dart';

class NotesListItem extends StatelessWidget {
  final Note note;

  const NotesListItem({super.key, required this.note});

  void openNote(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OpenNote(note: note)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openNote(context),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary),
        height: 70,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(7),
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                note.content,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              )
            ]),
      ),
    );
  }
}
