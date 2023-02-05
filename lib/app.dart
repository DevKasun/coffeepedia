import 'package:coffeepedia/screens/home_screen.dart';
import 'package:coffeepedia/screens/login_screen.dart';
import 'package:coffeepedia/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      initialRoute: '/',
      routes: {
        '/': (content) => const HomeScreen(),
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
