// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class AddNoteScreen extends StatelessWidget {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   final DatabaseService _database = DatabaseService();
//
//   AddNoteScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Note"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(labelText: "Title"),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _bodyController,
//               decoration: InputDecoration(labelText: "Body"),
//               maxLines: 8,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               // onPressed: () async {
//               //   if (_titleController.text.isNotEmpty &&
//               //       _bodyController.text.isNotEmpty) {
//               //     await _database.addNote({
//               //       "title": _titleController.text,
//               //       "body": _bodyController.text,
//               //     } as String);
//               //     Navigator.pop(context); // Return to NotesScreen
//               //   }
//               // },
//               onPressed: () async {
//                 if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
//                   await _database.addNote(
//                     _titleController.text,  // Pass the title
//                     _bodyController.text,   // Pass the body
//                   );
//                   _titleController.clear();
//                   _bodyController.clear();
//                   Navigator.pop(context); // Navigate back to the NotesScreen
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Title and Body cannot be empty')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
//               child: Text("Save"),
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
// class AddNoteScreen extends StatelessWidget {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   final DatabaseService _database = DatabaseService();
//
//   AddNoteScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Note"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _titleController,
//                   decoration: InputDecoration(labelText: "Title", border: InputBorder.none),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _bodyController,
//                   decoration: InputDecoration(labelText: "Body", border: InputBorder.none),
//                   maxLines: 8,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
//                   await _database.addNote(
//                     _titleController.text,  // Pass the title
//                     _bodyController.text,   // Pass the body
//                   );
//                   _titleController.clear();
//                   _bodyController.clear();
//                   Navigator.pop(context); // Navigate back to the NotesScreen
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Title and Body cannot be empty')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 elevation: 5, // Increase elevation for a more pronounced shadow
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
//               ),
//               child: Text(
//                 "Save Note",
//                 style: TextStyle(
//                   color: Colors.white, // White text color
//                   fontSize: 16, // Slightly bigger text
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class AddNoteScreen extends StatelessWidget {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   final DatabaseService _database = DatabaseService();
//
//   AddNoteScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Note"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(labelText: "Title"),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _bodyController,
//               decoration: InputDecoration(labelText: "Body"),
//               maxLines: 5,
//               keyboardType: TextInputType.multiline,
//               textInputAction: TextInputAction.done,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
//                   await _database.addNote(
//                     _titleController.text,  // Pass the title
//                     _bodyController.text,   // Pass the body
//                   );
//                   _titleController.clear();
//                   _bodyController.clear();
//                   Navigator.pop(context); // Navigate back to the NotesScreen
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Title and Body cannot be empty')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,  // Match the app bar color
//                 minimumSize: Size(double.infinity, 50),  // Increased size
//               ),
//               child: Text(
//                 "Save Note",
//                 style: TextStyle(color: Colors.white),  // White text color
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:todo_notes/db_services/database.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final DatabaseService _database = DatabaseService();

  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      //resizeToAvoidBottomInset: true,
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
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: InputBorder.none,  // Remove the default border
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
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
                child: TextField(
                  controller: _bodyController,
                  decoration: InputDecoration(
                    labelText: "Body",
                    border: InputBorder.none,  // Remove the default border
                    contentPadding: EdgeInsets.all(16),
                  ),
                  maxLines: 15,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
                    await _database.addNote(
                      _titleController.text,  // Pass the title
                      _bodyController.text,   // Pass the body
                    );
                    _titleController.clear();
                    _bodyController.clear();
                    Navigator.pop(context); // Navigate back to the NotesScreen
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Title and Body cannot be empty')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,  // Match the app bar color
                  minimumSize: Size(double.infinity, 50),  // Increased size
                ),
                child: Text(
                  "Save Note",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),  // Bold and white text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
