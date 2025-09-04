import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  String? Function(String?)? validate;
  CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50.0),
      child: TextFormField(
        validator: validate,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
