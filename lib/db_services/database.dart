
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> addPersonalTask(Map<String, dynamic> userPersonalMap) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Personal")
          .add(userPersonalMap);
    } catch (e) {
      print("Error adding personal task: $e");
    }
  }


  Future<void> addCollegeTask(Map<String, dynamic> userPersonalMap) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("College")
          .add(userPersonalMap);
    } catch (e) {
      print("Error adding college task: $e");
    }
  }


  Future<void> addOfficeTask(Map<String, dynamic> userPersonalMap) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Office")
          .add(userPersonalMap);
    } catch (e) {
      print("Error adding office task: $e");
    }
  }

  // Future<void> addNote(String text) async {
  //   try {
  //     String userId = _auth.currentUser!.uid;
  //     await FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(userId)
  //         .collection("Notes")
  //         .add({
  //       'text': text,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print("Error adding note: $e");
  //   }
  // }
  Future<void> addNote(String title, String body) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Notes")
          .add({
        'title': title,                // Note title
        'body': body,                  // Note body
        'timestamp': FieldValue.serverTimestamp(), // Timestamp for sorting
      });
    } catch (e) {
      print("Error adding note: $e");
    }
  }


  Future<Stream<QuerySnapshot>> getTasks(String category) async {
    try {
      String userId = _auth.currentUser!.uid;
      return FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection(category)
          .snapshots();
    } catch (e) {
      print("Error fetching tasks for category $category: $e");
      return Stream.empty();
    }
  }

  // Future<Stream<QuerySnapshot>> getNotes() async {
  //   try {
  //     String userId = _auth.currentUser!.uid;
  //     return FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(userId)
  //         .collection("Notes")
  //         .orderBy('timestamp', descending: true)
  //         .snapshots();
  //   } catch (e) {
  //     print("Error fetching notes: $e");
  //     return Stream.empty();
  //   }
  // }
  // Future<Stream<List<Map<String, dynamic>>>> getNotes() async {
  //   try {
  //     String userId = _auth.currentUser!.uid;
  //     final snapshot = await FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(userId)
  //         .collection("Notes")
  //         .orderBy('timestamp', descending: true)
  //         .get();
  //
  //     if (snapshot.docs.isEmpty) {
  //       return Stream.empty();
  //     }
  //
  //     final notes = snapshot.docs.map((doc) {
  //       return {
  //         'id': doc.id,
  //         'text': doc['text'],
  //         'timestamp': doc['timestamp'],
  //       };
  //     }).toList();
  //
  //     return Stream.value(notes);
  //   } catch (e) {
  //     print("Error fetching notes: $e");
  //     return Stream.empty();
  //   }
  // }

  // Stream<List<Map<String, dynamic>>> getNotes() {
  //   try {
  //     String userId = _auth.currentUser!.uid;
  //     return FirebaseFirestore.instance
  //         .collection("Users")
  //         .doc(userId)
  //         .collection("Notes")
  //         .orderBy('timestamp', descending: true)
  //         .snapshots()
  //         .map((snapshot) {
  //       if (snapshot.docs.isEmpty) {
  //         return [];
  //       }
  //       return snapshot.docs.map((doc) {
  //         return {
  //           'id': doc.id,
  //           'text': doc['text'],
  //           'timestamp': doc['timestamp'],
  //         };
  //       }).toList();
  //     });
  //   } catch (e) {
  //     print("Error fetching notes: $e");
  //     return Stream.empty();
  //   }
  // }

  Stream<List<Map<String, dynamic>>> getNotes() {
    try {
      String userId = _auth.currentUser!.uid;
      return FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Notes")
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) {
        if (snapshot.docs.isEmpty) {
          return [];
        }
        return snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'title': doc['title'],     // Fetch the title
            'body': doc['body'],       // Fetch the body
            'timestamp': doc['timestamp'], // Fetch the timestamp
          };
        }).toList();
      });
    } catch (e) {
      print("Error fetching notes: $e");
      return Stream.empty();
    }
  }

  Future<void> markTaskAsComplete(String taskId, String category) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection(category)
          .doc(taskId)
          .update({"Yes": true});
    } catch (e) {
      print("Error marking task as complete: $e");
    }
  }


  Future<void> deleteTask(String taskId, String category) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection(category)
          .doc(taskId)
          .delete();
    } catch (e) {
      print("Error deleting task: $e");
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Notes")
          .doc(noteId)
          .delete();
    } catch (e) {
      print("Error deleting note: $e");
    }
  }

  Future<void> updateNote(String noteId, String newTitle, String newBody) async {
    try {
      String userId = _auth.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("Notes")
          .doc(noteId)
          .update({
        "title": newTitle,
        "body": newBody,
        "timestamp": FieldValue.serverTimestamp(), // Update timestamp
      });
    } catch (e) {
      print("Error updating note: $e");
    }
  }
}


