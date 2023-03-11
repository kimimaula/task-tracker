import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({required Key key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Task List Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addtask');
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
    );
  }
}
