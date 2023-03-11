import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({required Key key}) : super(key: key);

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _completedTimeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _completedTimeController = TextEditingController();
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
    _completedTimeController = TextEditingController(
        text: DateFormat('M-d-yyyy')
            .format(DateTime.parse(task['completedDate'])));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comleted Task'),
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
                    enabled: false,
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
                      enabled: false,
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task Description',
                      ),
                      maxLines: 10),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    enabled: false,
                    controller: _completedTimeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task Completion Date',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
