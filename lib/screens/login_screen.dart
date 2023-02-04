import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String username = "";
    String password = "";

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
                key: formKey,
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
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 15.0,
                        ),
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
                      validator: (String? value) {
                        if (value != null) {
                          if (value.length == 0) {
                            return "Username required";
                          }
                        }
                        return null;
                      },
                      onSaved: (String? newValue) {
                        username = newValue!;
                        print("Password saved");
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 15.0,
                        ),
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
                      validator: (String? value) {
                        if (value != null) {
                          if (value.length == 0) {
                            return "Password required";
                          }
                        }
                        return null;
                      },
                      onSaved: (String? newValue) {
                        password = newValue!;
                        print("Password saved");
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                return;
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Processing Data')),
                                // );
                              }

                              // save to form values
                              formKey.currentState!.save();

                              // check username and password
                              if (username == "kasun" && password == "1234") {
                                Navigator.pushNamed(context, "/home");
                                print("Going to the home screen");
                              }

                              print("Data passed to the API");
                            },
                            child: Text("Login"),
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
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        "Sign up",
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
