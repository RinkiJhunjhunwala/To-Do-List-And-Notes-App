
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import 'db_services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Personal = true, College = false, Office = false;
  TextEditingController todoController = TextEditingController();
  Stream<QuerySnapshot>? todoStream;


  getOnTheLoad(String category) async {
    todoStream = await DatabaseService().getTasks(category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOnTheLoad("Personal");
  }

  Widget getWork() {
    return StreamBuilder<QuerySnapshot>(
      stream: todoStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No tasks available",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                SizedBox(height:4),
                Image.asset('assets/no_task.jpeg', height: 150),
                SizedBox(height: 20),

                Text(
                  "Press the add button to add tasks",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot docSnap = snapshot.data!.docs[index];
              return CheckboxListTile(
                activeColor: Colors.greenAccent.shade400,
                title: Text(
                  docSnap["work"],
                  style: TextStyle(
                    decoration: docSnap["Yes"] ? TextDecoration.lineThrough : null,
                  ),
                ),
                value: docSnap["Yes"],
                onChanged: (newValue) async {

                  await DatabaseService().markTaskAsComplete(
                    docSnap.id,
                    Personal ? "Personal" : College ? "College" : "Office",
                  );
                  setState(() {});


                  Future.delayed(Duration(seconds: 2), () {
                    DatabaseService().deleteTask(
                      docSnap.id,
                      Personal ? "Personal" : College ? "College" : "Office",
                    );
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[800],
        onPressed: openBox,
        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
      // appBar: AppBar(
      //   backgroundColor:  Color(0xFFD8A7F1),
      //   // actions: [
      //   //   IconButton(
      //   //     icon: Icon(Icons.exit_to_app),
      //   //     onPressed: () async {
      //   //       await FirebaseAuth.instance.signOut();
      //   //       Navigator.pushReplacementNamed(context, '/login');
      //   //     },
      //   //   ),
      //   //   Padding(
      //   //     padding: const EdgeInsets.only(right: 10),
      //   //     child: Text(
      //   //       "Sign Out",
      //   //       style: TextStyle(color: Colors.black),
      //   //     ),
      //   //   ),
      //   // ],
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.white,
        //       Colors.purple.shade200,
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Text(
                "To-Do List",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Here are your to-do tasks",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Personal
                    ? selectedCategory("Personal")
                    : unselectedCategory("Personal", () async {
                  setState(() {
                    Personal = true;
                    College = false;
                    Office = false;
                  });
                  await getOnTheLoad("Personal");
                }),
                College
                    ? selectedCategory("College")
                    : unselectedCategory("College", () async {
                  setState(() {
                    Personal = false;
                    College = true;
                    Office = false;
                  });
                  await getOnTheLoad("College");
                }),
                Office
                    ? selectedCategory("Office")
                    : unselectedCategory("Office", () async {
                  setState(() {
                    Personal = false;
                    College = false;
                    Office = true;
                  });
                  await getOnTheLoad("Office");
                }),
              ],
            ),
            SizedBox(height: 20),
            getWork(),
          ],
        ),
      ),
    );
  }

  Widget selectedCategory(String category) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.purple.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget unselectedCategory(String category, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future openBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel, color: Colors.black, size: 30),
                ),
                SizedBox(width: 60.0),
                Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.purple.shade700, // Violet color
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the task",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> userTodo = {
                          "work": todoController.text,
                          "id": id,
                          "Yes": false,
                        };
                        if (Personal) {
                          DatabaseService().addPersonalTask(userTodo);
                        } else if (College) {
                          DatabaseService().addCollegeTask(userTodo);
                        } else {
                          DatabaseService().addOfficeTask(userTodo);
                        }
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}