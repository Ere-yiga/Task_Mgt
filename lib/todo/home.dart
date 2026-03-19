import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  List <String> sumn = [];
  void doSumn() {
    setState(() {
      sumn.add(nameController.text);
      nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("ToDo", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 27, 34, 27),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter task",
              ),
            ),
          ),

          ElevatedButton(onPressed: doSumn, child: Text("Add Task")),

          Column(
            children: sumn.map((task) => Text(task)).toList(),
          )
        ],
      ),
    );
  }
}
