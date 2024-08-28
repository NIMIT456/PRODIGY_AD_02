import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final String? initialTask;

  AddTaskScreen({this.initialTask});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: initialTask);

    return Scaffold(
      appBar: AppBar(
        title: Text(initialTask == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
