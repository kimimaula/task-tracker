import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({required Key key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('test task page'),
      ),
    );
  }
}
