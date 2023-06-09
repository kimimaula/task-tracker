import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intro.dart';
import 'tasks_list.dart';
import 'complete_list.dart';
import 'addtask.dart';
import 'update_task.dart';
import 'completed_task.dart';

class TaskList with ChangeNotifier {
  final List<Map<String, dynamic>> _tasks = [
    {'taskId': '1', 'taskName': 'Task 1', 'taskDescription': 'Description 1'},
    {'taskId': '2', 'taskName': 'Task 2', 'taskDescription': 'Description 2'},
    {'taskId': '3', 'taskName': 'Task 3', 'taskDescription': 'Description 3'},
  ];
  final List<Map<String, dynamic>> _completedTasks = [
    {
      'taskId': '4',
      'taskName': 'Task 4',
      'taskDescription': 'Description 4',
      'completedDate': DateTime.now().toString()
    },
    {
      'taskId': '5',
      'taskName': 'Task 5',
      'taskDescription': 'Description 5',
      'completedDate': DateTime.now().toString()
    },
  ];

  List<Map<String, dynamic>> get tasks => _tasks;
  List<Map<String, dynamic>> get completedTasks => _completedTasks;

  void addTask(Map<String, dynamic> task, [String? text]) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(String taskId, Map<String, dynamic> updatedTask) {
    Map<String, dynamic> task =
        _tasks.firstWhere((task) => task['taskId'] == taskId);
    task['taskName'] = updatedTask['taskName'];
    task['taskDescription'] = updatedTask['taskDescription'];
    notifyListeners();
  }

  void deleteTask(String taskId) {
    Map<String, dynamic> task =
        _tasks.firstWhere((task) => task['taskId'] == taskId);
    _tasks.remove(task);
    notifyListeners();
  }

  void completeTask(String taskId, DateTime completedDate) {
    Map<String, dynamic> task =
        _tasks.firstWhere((task) => task['taskId'] == taskId);
    task['completedDate'] = completedDate.toString();
    _completedTasks.add(task);
    _tasks.remove(task);
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskList()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kimmi Shopper',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.red,
          contentTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) =>
                  const MyHomePage(title: 'Kimmi Demo Task List');
              break;
            case '/addtask':
              builder = (BuildContext _) => AddTask(
                    key: UniqueKey(),
                  );
              break;
            case '/updateTask':
              builder = (BuildContext _) => UpdateTask(
                    key: UniqueKey(),
                  );
              break;
            case '/completedTask':
              builder = (BuildContext _) => CompletedTask(
                    key: UniqueKey(),
                  );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Introduction',
      style: optionStyle,
    ),
    Text(
      'Tasks List',
      style: optionStyle,
    ),
    Text(
      'Completed',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return IntroPage(key: UniqueKey());
      case 1:
        return Tasks(
          key: UniqueKey(),
        );
      case 2:
        return CompletePg(
          key: UniqueKey(),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
      ),
      body: Center(
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tasks List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
