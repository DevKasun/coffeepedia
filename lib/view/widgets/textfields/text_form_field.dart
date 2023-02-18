import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  bool isPassword;
  String? Function(String?) onValidate;
  void Function(String?) onSaved;

  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.isPassword,
      required this.onValidate,
      required this.onSaved});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.hintText,
      ),
      obscureText: widget.isPassword,
      validator: widget.onValidate,
      onSaved: widget.onSaved,
    );
  }
}
