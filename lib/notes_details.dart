

import 'package:flutter/material.dart';
import 'package:todo_notes/db_services/database.dart';
import 'package:todo_notes/edit_note.dart';

class NoteDetailScreen extends StatefulWidget {
  final Map<String, dynamic> note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late Map<String, dynamic> _note; // Storing the note details locally

  final DatabaseService _database = DatabaseService();

  @override
  void initState() {
    super.initState();
    _note = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white,),
            onPressed: () async {
              await _database.deleteNote(_note['id']);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _note['title'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(color: Colors.grey, thickness: 1),
                    Text(
                      _note['body'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to EditNoteScreen
          final updatedNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(note: _note),
            ),
          );

          if (updatedNote != null) {

            setState(() {
              _note = updatedNote;
            });
          }
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
