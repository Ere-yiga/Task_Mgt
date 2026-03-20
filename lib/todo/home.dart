import 'package:flutter/material.dart';

class Sumn {
  String title;
  bool isDone;
  
  Sumn({required this.title, required this.isDone});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();

  List<Sumn> sumn = [];
  void doSumn() {
    if (nameController.text.isEmpty) return;
    setState(() {
      sumn.add(Sumn(title: nameController.text, isDone: false));
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
      body: ListView(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: sumn
                .map(
                  (task) => Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Checkbox(
                          value: task.isDone,
                          onChanged: (value) {
                            setState(() {
                              task.isDone = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              sumn.remove(task);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
