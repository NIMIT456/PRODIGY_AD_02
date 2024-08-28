import 'package:flutter/material.dart';
import 'package:to_do_list_app/screens/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _editTask(int index, String task) {
    setState(() {
      tasks[index] = task;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    String? editedTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskScreen(
                          initialTask: tasks[index],
                        ),
                      ),
                    );
                    if (editedTask != null) {
                      _editTask(index, editedTask);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTask(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String? newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
          if (newTask != null) {
            _addTask(newTask);
          }
        },
      ),
    );
  }
}
