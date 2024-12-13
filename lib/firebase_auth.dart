

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'email': email,
        'tasks': [],
        'notes': [],
      });
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<void> logOut() async {
    await _auth.signOut();
  }


  User? getCurrentUser() {
    return _auth.currentUser;
  }


  Future<List<Map<String, dynamic>>> getUserTasks() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('Users').doc(user.uid).get();
      if (userDoc.exists) {
        List<dynamic> tasks = userDoc['tasks'] ?? [];
        return tasks.map((task) => task as Map<String, dynamic>).toList();
      }
    }
    return [];
  }


  Future<void> addTask(Map<String, dynamic> taskData) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef = _firestore.collection('Users').doc(user.uid);
      await userDocRef.update({
        'tasks': FieldValue.arrayUnion([taskData]),
      });
    }
  }

  Future<void> removeTask(String taskId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef = _firestore.collection('Users').doc(user.uid);
      await userDocRef.update({
        'tasks': FieldValue.arrayRemove([{'id': taskId}]),
      });
    }
  }

  // For Notes
  Future<List<Map<String, dynamic>>> getUserNotes() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('Users').doc(user.uid).get();
      if (userDoc.exists) {
        List<dynamic> notes = userDoc['notes'] ?? [];
        return notes.map((note) => note as Map<String, dynamic>).toList();
      }
    }
    return [];
  }

  Future<void> addNote(Map<String, dynamic> noteData) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef = _firestore.collection('Users').doc(user.uid);
      await userDocRef.update({
        'notes': FieldValue.arrayUnion([noteData]),
      });
    }
  }

  Future<void> removeNote(String noteId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef = _firestore.collection('Users').doc(user.uid);
      await userDocRef.update({
        'notes': FieldValue.arrayRemove([{'id': noteId}]),
      });
    }
  }
}
