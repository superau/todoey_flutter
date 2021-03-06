import 'package:ag/models/Task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_title.dart';
import 'package:ag/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTitle(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
