import 'package:flutter/material.dart';
import 'package:baithtuan3_4/routes.dart';
import 'package:baithtuan3_4/screens/profile/profile_screen.dart';
import 'package:baithtuan3_4/screens/splash/splash_screen.dart';
import 'package:baithtuan3_4/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
