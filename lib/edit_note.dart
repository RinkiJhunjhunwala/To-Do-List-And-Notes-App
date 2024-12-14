// import 'package:flutter/material.dart';
// import 'package:todo_notes/db_services/database.dart';
//
// class EditNoteScreen extends StatefulWidget {
//   final Map<String, dynamic> note;
//
//   const EditNoteScreen({super.key, required this.note});
//
//   @override
//   _EditNoteScreenState createState() => _EditNoteScreenState();
// }
//
// class _EditNoteScreenState extends State<EditNoteScreen> {
//   late TextEditingController _titleController;
//   late TextEditingController _bodyController;
//   final DatabaseService _database = DatabaseService();
//
//   @override
//   void initState() {
//     super.initState();
//     _titleController = TextEditingController(text: widget.note['title']);
//     _bodyController = TextEditingController(text: widget.note['body']);
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _bodyController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Note"),
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
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _titleController,
//                     decoration: InputDecoration(
//                       labelText: "Title",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: _bodyController,
//                     decoration: InputDecoration(
//                       labelText: "Body",
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 8,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_titleController.text.isNotEmpty &&
//                           _bodyController.text.isNotEmpty) {
//                         await _database.updateNote(
//                           widget.note['id'],
//                           _titleController.text,
//                           _bodyController.text,
//                         );
//                         Navigator.pop(context); // Return to NoteDetailScreen
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Title and Body cannot be empty'),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepPurple,
//                     ),
//                     child: Text("Save", style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
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

class EditNoteScreen extends StatefulWidget {
  final Map<String, dynamic> note;

  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  final DatabaseService _database = DatabaseService();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note['title']);
    _bodyController = TextEditingController(text: widget.note['body']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Edit Note", style: TextStyle(color: Colors.white,),),
        backgroundColor: Colors.deepPurple,
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
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Divider(color: Colors.grey),
                    TextField(
                      controller: _bodyController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Body",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_titleController.text.isNotEmpty &&
                      _bodyController.text.isNotEmpty) {
                    await _database.updateNote(
                      widget.note['id'],
                      _titleController.text,
                      _bodyController.text,
                    );
                    Navigator.pop(context, {
                      'id': widget.note['id'],
                      'title': _titleController.text,
                      'body': _bodyController.text,
                    }); // Pass the updated note back
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Title and Body cannot be empty')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
