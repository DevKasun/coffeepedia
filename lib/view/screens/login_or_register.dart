import 'package:coffeepedia/service/firebase_auth_service.dart';
import 'package:coffeepedia/view/widgets/textfields/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  final formKey = GlobalKey<FormState>();

  int activeSegmant = 0;

  String email = "";
  String password = "";

  String? errorMessage = "";

  final emailReg =
      RegExp(r"^[A-Za-z0-9._+\-\']+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        title: Text("Login or Register"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [_buildForm()],
            ),
          ),
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          Lottie.asset(
            'assets/images/coffee.json',
            width: 150,
            height: 150,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20),
          _getSegmantedControl(),
          SizedBox(height: 20),
          CustomTextFormField(
            hintText: "Enter Email",
            isPassword: false,
            onValidate: (String? value) {
              if (value != null) {
                if (emailReg.hasMatch(value) == false) {
                  return "Please enter valid email";
                }
              }
              return null;
            },
            onSaved: (String? value) {
              this.email = value!;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            hintText: "Enter Password",
            isPassword: true,
            onValidate: (String? value) {
              if (value != null) {
                if (value.isEmpty) {
                  return "Please enter valid password";
                }
              }
              return null;
            },
            onSaved: (String? value) {
              this.password = value!;
            },
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _loginOrRegister,
                  child: Text(activeSegmant == 0 ? "Login" : "Register"),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          _getErrorMsg(),
        ],
      ),
    );
  }

  _loginOrRegister() async {
    setState(() {
      errorMessage = "";
    });

    if (formKey.currentState!.validate() == false) {
      return;
    }
    print("validation pass!!!");
    formKey.currentState!.save();

    try {
      if (activeSegmant == 0) {
        await FirebaseAuthService()
            .loginWithEmailAndPassword(email: email, password: password);
      } else {
        await FirebaseAuthService()
            .registerWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseAuthException catch (error) {
      setState(() {
        errorMessage = error.message;
      });
    }
  }

  Widget _getErrorMsg() {
    if (errorMessage != null) {
      if (errorMessage!.isNotEmpty) {
        return Container(
          child: Text(
            errorMessage!,
            style: TextStyle(color: Colors.red[400]),
          ),
        );
      }
    }

    return SizedBox();
  }

  _getSegmantedControl() {
    return Row(
      children: [
        Expanded(
          child: CupertinoSlidingSegmentedControl(
            children: {
              0: Text(
                "Login",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              1: Text(
                "Register",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            },
            groupValue: activeSegmant,
            onValueChanged: (value) {
              setState(() {
                activeSegmant = value!;
              });
            },
            thumbColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
