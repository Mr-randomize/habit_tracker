import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/constants/app_assets.dart';
import 'package:habit_tracker/constants/app_colors.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/persistence/hive_data_store.dart';
import 'package:habit_tracker/ui/home/home_page.dart';
import 'package:habit_tracker/ui/theming/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadSVGs();
  final datastore = HiveDataStore();
  await datastore.init();
  await datastore.createDemoTasks(
    tasks: [
      Task.create(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
      Task.create(name: 'Walk the Dog', iconName: AppAssets.dog),
      Task.create(name: 'Do Some Coding', iconName: AppAssets.html),
      Task.create(name: 'Meditate', iconName: AppAssets.meditation),
      Task.create(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
      Task.create(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
    ],
    force: false,
  );
  runApp(ProviderScope(
    overrides: [
      dataStoreProvider.overrideWithValue(datastore),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
      ),
      home: AppTheme(
        data: AppThemeData.defaultWithSwatch(AppColors.red),
        child: HomePage(),
      ),
    );
  }
}
