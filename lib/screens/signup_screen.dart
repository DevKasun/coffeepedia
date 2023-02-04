import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/coffee-cup.jpg"),
                fit: BoxFit.cover),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "CoffeePedia",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 175, 69, 7),
                              width: 2.0),
                        ),
                        hintText: 'username',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 175, 69, 7),
                              width: 2.0),
                        ),
                        hintText: 'email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 175, 69, 7),
                              width: 2.0),
                        ),
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      obscuringCharacter: "*",
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 175, 69, 7),
                              width: 2.0),
                        ),
                        hintText: 'Confirm password',
                      ),
                      obscureText: true,
                      obscuringCharacter: "*",
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Sign up"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 241, 136, 37),
                              textStyle: const TextStyle(fontSize: 22),
                              fixedSize: Size(0, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
