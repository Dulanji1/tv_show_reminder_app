import 'package:flutter/material.dart';
import 'package:my_tv_reminder_app/controllers/wishlist_controller.dart';
import 'package:my_tv_reminder_app/ui/AddSeries.dart';
import 'package:my_tv_reminder_app/ui/MyWishlistPage.dart';
import 'package:get/get.dart';
import 'package:my_tv_reminder_app/services/theme_service.dart';



class Wishlist_Screen extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  var notificationHelper;

  @override
  void initState() {
    notificationHelper.initializeNotification();
    notificationHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      navigatorKey:navigatorKey,
      home: Scaffold(
        appBar: _appBar(),
        body: MyWishlistPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>AddSeries())
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap:(){
          ThemeService().switchTheme();
          notificationHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode? "Activated Lumoz Light Theme": "Activated Lumoz Dark Theme"
          );
          //notificationHelper.scheduledNotification();
        },
        child: Icon(Get.isDarkMode? Icons.wb_sunny: Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode? Colors.white : Colors.black),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage(
              "images/profile.jpg"
          ),
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}
