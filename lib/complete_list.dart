import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:intl/intl.dart';

class CompletePg extends StatefulWidget {
  const CompletePg({required Key key}) : super(key: key);

  @override
  State<CompletePg> createState() => _CompletePgState();
}

class _CompletePgState extends State<CompletePg> {
  @override
  Widget build(BuildContext context) {
    TaskList taskList = Provider.of<TaskList>(context);
    return Scaffold(
      body: taskList.completedTasks.isEmpty
          ? const Center(
              child: Text("No tasks completed yet :("),
            )
          : ListView.builder(
              itemCount: taskList.completedTasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = taskList.completedTasks[index];
                return Card(
                  elevation: 2, // box shadow
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: ListTile(
                    title: Text(task['taskName']),
                    subtitle: Text(
                      task['taskDescription'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                        'Completed: ${DateFormat('M-d-yyyy').format(DateTime.parse(task['completedDate']))}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/updateTask',
                        arguments: task,
                      );
                    },
                  ),
                );
              },
            ),
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
