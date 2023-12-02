import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subjects List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blue[50]
      ),
      home: const SubjectsList(),
    );
  }
}

class SubjectsList extends StatefulWidget {
  const SubjectsList({super.key});

  @override
  State<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  final List<String> _subjects = [];

  void addSubject() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String text = "";
          return AlertDialog(
            title: const Text("Add new subject"),
            content: TextField(
              onChanged: (input) {
                text = input;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (text.isNotEmpty) {
                      setState(() {
                        _subjects.add(text);
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "201065",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: _subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(_subjects[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete_rounded),
              onPressed: () {
                setState(() {
                  _subjects.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addSubject,
        child: const Icon(Icons.add),
      ),
    );
  }
}
