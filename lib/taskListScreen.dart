import  'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<String> tasks = [
    'Tarefa 1',
    'Tarefa 2',
    'Tarefa 3',
    'Tarefa 4'
  ];

  late List<bool> completed;

  @override
  void initState() {
    super.initState();
    completed = List.filled(tasks.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              completed[index] ? Icons.check_circle : Icons.radio_button_unchecked,
              color: completed[index] ? Colors.green : null,
            ),
            title: Text(tasks[index]),
            onTap: () {
              setState(() {
                completed[index] = !completed[index];
              });
            },
          );
        } ,
      ),
    );
  }
}