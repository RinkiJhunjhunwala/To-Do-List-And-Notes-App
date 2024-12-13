import 'package:flutter/material.dart';
import 'package:todo_notes/firebase_auth.dart';
import 'homescreen.dart';
import 'notes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AuthService _auth = AuthService();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotesScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD8A7F1),
        title: const Text("To-Do List & Notes"),
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.logOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            label: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'To-Do List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}
