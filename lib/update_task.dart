import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({required Key key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TaskList taskList = Provider.of<TaskList>(context);
    final task =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _nameController = TextEditingController(text: task['taskName']);
    _descriptionController =
        TextEditingController(text: task['taskDescription']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 60.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task Description',
                      ),
                      maxLines: 10),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  taskList.updateTask(task['taskId'], {
                    "taskName": _nameController.text,
                    "taskDescription": _descriptionController.text,
                  });
                  Navigator.pop(context);
                },
                child: const Text('Update Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
