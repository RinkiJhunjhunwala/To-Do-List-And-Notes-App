//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
// import 'package:todo_notes/firebase_auth.dart';
//
// class NotesScreen extends StatefulWidget {
//   const NotesScreen({Key? key}) : super(key: key);
//
//   @override
//   _NotesScreenState createState() => _NotesScreenState();
// }
//
//
// class _NotesScreenState extends State<NotesScreen> {
//   final AuthService _auth = AuthService();
//   final DatabaseService _database = DatabaseService();
//
//   final TextEditingController _noteController = TextEditingController();
//   late Stream<List<Map<String, dynamic>>> _notesStream;
//
//   @override
//   void initState() {
//     super.initState();
//     _notesStream = _database.getNotes() as Stream<List<Map<String, dynamic>>>;
//   }
//
//   Future<void> _addNote() async {
//     if (_noteController.text.isNotEmpty) {
//       await _database.addNote(_noteController.text);
//       _noteController.clear();
//     }
//   }
//
//   Future<void> _deleteNote(String noteId) async {
//     await _database.deleteNote(noteId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//
//           SizedBox(height:20),
//           Center(
//             child: Text(
//               "Notes",
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Align(
//               alignment: Alignment.centerLeft, // Left-aligned subtitle
//               child: Text(
//                 "Here are your notes",
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Expanded(
//             child: StreamBuilder<List<Map<String, dynamic>>>(
//               stream: _notesStream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'No notes found.',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Image.asset(
//                           'assets/no_notes1.png',
//                           height: 200,
//                           width: 200,
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   final notes = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: notes.length,
//                     itemBuilder: (context, index) {
//                       final note = notes[index];
//                       return Container(
//                         margin: EdgeInsets.all(8.0),
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                             ),
//                           ],
//                         ),
//                         child: ListTile(
//                           title: Text(note['text']),
//                           trailing: IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _deleteNote(note['id']),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _noteController,
//                     decoration: InputDecoration(hintText: 'Enter a new note'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add, color: Colors.deepPurple),
//                   onPressed: _addNote,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_notes/add_notes.dart';
import 'package:todo_notes/db_services/database.dart';
import 'package:todo_notes/notes_details.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DatabaseService _database = DatabaseService();
  late Stream<List<Map<String, dynamic>>> _notesStream;

  @override
  void initState() {
    super.initState();
    _notesStream = _database.getNotes() as Stream<List<Map<String, dynamic>>>; // Fetch notes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Notes"),
      //   backgroundColor: Colors.deepPurple,
      // ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     "Notes",
          //     style: TextStyle(
          //       fontSize: 36,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     "Here are your notes",
          //     style: TextStyle(
          //       fontSize: 22,
          //       color: Colors.black87,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          SizedBox(height:20),
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
                  // return Center(
                  //   child: Text(
                  //     "No notes found.",
                  //     style: TextStyle(fontSize: 20, color: Colors.grey),
                  //   ),
                  // );
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
                              SizedBox(height: 20),
                              Image.asset(
                                'assets/no_notes1.png',
                                height: 200,
                                width: 200,
                              ),
                            ],
                          ),
                        );
                } else {
                  final notes = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two boxes per row
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 2 / 2, // Adjust box dimensions
                      ),
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteDetailScreen(note: note),
                              ),
                            );
                          },
                          child: Container(
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
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note['title'], // Note title
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  note['body'], // Note body
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}
