import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  List<String> sumn = [];
  void doSumn() {
    if(nameController.text.isEmpty) return;
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
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
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

          ElevatedButton(onPressed: doSumn, style: ElevatedButton.styleFrom(padding: EdgeInsets.all(2)), child: Text("Add Task")),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: sumn.map(
              (task) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(task),
                    )
                  ,
                  //SizedBox(width: 50),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        sumn.remove(task);
                      });
                    },
                  ),
                ]),
              ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
