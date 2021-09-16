import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoet_flutter/models/task_data.dart';
import 'package:todoet_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.name,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallBack: () {
                  taskData.deleteTask(task);
                },
              );
            },
            itemCount: taskData.taskCount);
      },
    );
  }
}
