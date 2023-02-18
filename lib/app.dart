import 'package:coffeepedia/handler/auth_handler.dart';
import 'package:coffeepedia/view/screens/home_screen.dart';
import 'package:coffeepedia/view/screens/login_or_register.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final primaryColor = Colors.brown[600];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: primaryColor),
      debugShowCheckedModeBanner: false,
      home: AuthHandler(),
    );
  }
}
