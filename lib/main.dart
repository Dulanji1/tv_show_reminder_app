import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_tv_reminder_app/database/database_helper.dart';
import 'package:my_tv_reminder_app/models/wishlist.dart';
import 'package:my_tv_reminder_app/services/theme_service.dart';
import 'package:my_tv_reminder_app/ui/wishlist_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ensure initialize
  await DatabaseHelper.initDatabase();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeService().theme,
        home: Wishlist_Screen()
      //   home: const ReminderScreen()
    );
  }
}


