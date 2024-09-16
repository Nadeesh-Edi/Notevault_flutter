import 'package:flutter/material.dart';
import 'package:note_vault_flutter/components/header.dart';
import 'package:note_vault_flutter/models/note.dart';

class OpenNote extends StatelessWidget {
  final Note note;
  const OpenNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Header(
        title: note.title,
        body: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary),
            height: 70,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(7),
            alignment: Alignment.topLeft,
            child: Text(
              note.content,
              textAlign: TextAlign.start,
            )));
  }
}
