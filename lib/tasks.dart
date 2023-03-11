import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Tasks extends StatefulWidget {
  const Tasks({required Key key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    TaskList taskList = Provider.of<TaskList>(context);
    return Scaffold(
      body: taskList.tasks.isEmpty
          ? const Center(
              child: Text("No tasks yet :("),
            )
          : ListView.builder(
              itemCount: taskList.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = taskList.tasks[index];
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Delete'),
                                  content: const Text(
                                      'Are you sure you want to delete this task?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('CANCEL'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('DELETE'),
                                      onPressed: () {
                                        taskList.deleteTask(task['taskId']);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            // Do something when the button is pressed
                          },
                        ),
                      ],
                    ),
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
