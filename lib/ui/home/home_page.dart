import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/persistence/hive_data_store.dart';
import 'package:habit_tracker/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HiveDataStore datastore = ref.watch(dataStoreProvider);
    return ValueListenableBuilder(
      valueListenable: datastore.tasksListenable(),
      builder: (_, Box<Task> box, __) =>
          TasksGridPage(tasks: box.values.toList()),
    );
  }
}
