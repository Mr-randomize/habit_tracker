import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/text_styles.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/ui/task/animated_task.dart';
import 'package:habit_tracker/ui/theming/app_theme.dart';

class TaskWithName extends StatelessWidget {
  final Task task;
  final bool completed;
  final ValueChanged<bool>? onCompleted;

  const TaskWithName(
      {Key? key, required this.task, this.completed = false, this.onCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedTask(
            iconName: task.iconName,
            completed: completed,
            onCompleted: onCompleted,
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          height: 39,
          child: Text(
            task.name.toUpperCase(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyles.taskName.copyWith(
              color: AppTheme.of(context).accent,
            ),
          ),
        ),
      ],
    );
  }
}