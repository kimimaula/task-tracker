import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intro.dart';
import 'tasks.dart';
import 'complete.dart';
import 'addtask.dart';

class TaskList with ChangeNotifier {
  final List<Map<String, dynamic>> _tasks = [];
  final List<Map<String, dynamic>> _completedTasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;
  List<Map<String, dynamic>> get completedTasks => _completedTasks;

  void addTask(Map<String, dynamic> task, [String? text]) {
    _tasks.add(task);
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
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

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
      'Completed Tasks',
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
            label: 'Completed Tasks',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}
