import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/app_assets.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/ui/task/task_with_name.dart';

class AddTaskItem extends StatelessWidget {
  const AddTaskItem({Key? key, this.onCompleted}) : super(key: key);
  final VoidCallback? onCompleted;

  @override
  Widget build(BuildContext context) {
    return TaskWithName(
      task: Task(
        id: '',
        name: 'Add a task',
        iconName: AppAssets.plus,
      ),
      hasCompletedState: false,
      onCompleted: (completed) => onCompleted?.call(),
    );
  }
}
