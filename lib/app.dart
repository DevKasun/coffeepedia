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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (content) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}
