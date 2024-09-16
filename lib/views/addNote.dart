import 'package:flutter/material.dart';
import 'package:note_vault_flutter/components/header.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final String pagetitle = "Add Note";
  final String titleLabel = "Note title";
  final String contentLabel = "Note Content";
  final String saveButtonLabel = "Save";
  String _title = "";
  String _content = "";

  void saveNote(context) {
    if (_title == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter a title")));
    } else if (_content == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Content cannot be empty")));
    } else {
      // Save note to database or local storage
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Note saved")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: pagetitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(labelText: titleLabel),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              onChanged: (value) => {
                setState(() {
                  _title = value;
                })
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(labelText: contentLabel),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              onChanged: (value) => {
                setState(() {
                  _content = value;
                })
              },
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Text(saveButtonLabel,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                onPressed: () => saveNote(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
