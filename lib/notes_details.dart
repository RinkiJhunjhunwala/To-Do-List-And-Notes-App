// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class NoteDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> note;
//   final DatabaseService _database = DatabaseService();
//
//   NoteDetailScreen({super.key, required this.note});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(note['title']),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () async {
//               await _database.deleteNote(note['id']);
//               Navigator.pop(context); // Return to NotesScreen
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           note['body'],
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class NoteDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> note;
//   final DatabaseService _database = DatabaseService();
//
//   NoteDetailScreen({super.key, required this.note});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(note['title']),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete, color: Colors.white), // White icon color
//             onPressed: () async {
//               await _database.deleteNote(note['id']);
//               Navigator.pop(context); // Return to NotesScreen
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               note['body'],
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class NoteDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> note;
//   final DatabaseService _database = DatabaseService();
//
//   NoteDetailScreen({super.key, required this.note});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Note Details"),
//         backgroundColor: Colors.deepPurple, // Use the same purple as the AddNoteScreen app bar
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () async {
//               await _database.deleteNote(note['id']);
//               Navigator.pop(context); // Return to NotesScreen
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               note['title'],
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             SizedBox(height: 8),
//             Divider(color: Colors.grey, thickness: 1), // Add a line separator
//             SizedBox(height: 8),
//             Text(
//               note['body'],
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
// import 'package:todo_notes/edit_note.dart';
//
// class NoteDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> note;
//   final DatabaseService _database = DatabaseService();
//
//   NoteDetailScreen({super.key, required this.note});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.deepPurple, // Use the same purple as the AddNoteScreen app bar
//       // ),
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           GestureDetector(
//             onLongPress: () async {
//               // Show confirmation dialog before deleting the note
//               final bool? confirmDelete = await showDialog<bool>(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("Delete Note"),
//                   content: Text("Are you sure you want to delete this note?"),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context, false),
//                       child: Text("Cancel"),
//                     ),
//                     TextButton(
//                       onPressed: () => Navigator.pop(context, true),
//                       child: Text("Delete", style: TextStyle(color: Colors.red)),
//                     ),
//                   ],
//                 ),
//               );
//
//               if (confirmDelete == true) {
//                 await _database.deleteNote(note['id']);
//                 Navigator.pop(context); // Return to NotesScreen
//               }
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Icon(Icons.delete, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       note['title'],
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     SizedBox(height: 8),
//                     Divider(color: Colors.grey, thickness: 1), // Add a line separator
//                     SizedBox(height: 8),
//                     Text(
//                       note['body'],
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await _database.deleteNote(note['id']);
//           Navigator.pop(context);
//         },
//         backgroundColor: Colors.deepPurple,
//         child: Icon(Icons.delete, color: Colors.white),
//       ),
//
//     );
//   }
//
//

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
  late Map<String, dynamic> _note; // Store the note details locally

  final DatabaseService _database = DatabaseService();

  @override
  void initState() {
    super.initState();
    _note = widget.note; // Initialize with the passed note
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
              Navigator.pop(context); // Go back after deleting
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
            // Ensure UI is updated with the latest note
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
