import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({required Key key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tasks'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: <Widget>[
            const Text('Add Task Page'),
            const Spacer(),
            ElevatedButton(
              onPressed: () => {print('test')},
              child: const Text('Add Task'),
            ),
          ],
        ),
      )),
    );
  }
}
