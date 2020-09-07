import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, providerData, child) {
      return ListView.builder(
        itemCount: providerData.taskCount,
        itemBuilder: (context, index) {
          final task = providerData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkBoxState) {
              providerData.updateTask(task);
            },
            longPressCallback: () {
              providerData.deleteTask(index);
            },
          );
        },
      );
    });
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
//void checkboxCallback(bool checkBoxState) {
//  setState(() {
//    isChecked = checkBoxState;
//  });
//}
//
//class TaskCheckBox extends StatelessWidget {
//  final bool checkboxState;
//  final Function toggleCheckBoxState;
//
//  TaskCheckBox({this.checkboxState, this.toggleCheckBoxState});
//
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}
