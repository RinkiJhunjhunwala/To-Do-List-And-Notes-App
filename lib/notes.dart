
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_notes/db_services/database.dart';
import 'package:todo_notes/firebase_auth.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}


class _NotesScreenState extends State<NotesScreen> {
  final AuthService _auth = AuthService();
  final DatabaseService _database = DatabaseService();

  final TextEditingController _noteController = TextEditingController();
  late Stream<List<Map<String, dynamic>>> _notesStream;

  @override
  void initState() {
    super.initState();
    _notesStream = _database.getNotes() as Stream<List<Map<String, dynamic>>>;
  }

  Future<void> _addNote() async {
    if (_noteController.text.isNotEmpty) {
      await _database.addNote(_noteController.text);
      _noteController.clear();
    }
  }

  Future<void> _deleteNote(String noteId) async {
    await _database.deleteNote(noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Text('To-Do List & Notes App'),
      //   actions: [
      //     TextButton.icon(
      //       onPressed: () async {
      //         await _auth.logOut();
      //         Navigator.pushReplacementNamed(context, '/login');
      //       },
      //       icon: Icon(Icons.exit_to_app, color: Colors.white),
      //       label: Text('Sign Out', style: TextStyle(color: Colors.white)),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Here are your notes:',
          //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(height:10),
          Center(
            child: Text(
              "Notes",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Text(
          //   "Here are your notes",
          //   style: TextStyle(
          //     fontSize: 22,
          //     color: Colors.black87,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft, // Left-aligned subtitle
              child: Text(
                "Here are your notes",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _notesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //return Center(child: Text('No notes found.', style: TextStyle(fontSize: 20),));
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No notes found.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 20), // Add some space between text and image
                        Image.asset(
                          'assets/no_notes1.png', // Replace with your image path
                          height: 200,          // Adjust the size of the image
                          width: 200,
                        ),
                      ],
                    ),
                  );
                } else {
                  final notes = snapshot.data!;
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(16.0),
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
                        child: ListTile(
                          title: Text(note['text']),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteNote(note['id']),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(hintText: 'Enter a new note'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.deepPurple),
                  onPressed: _addNote,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
