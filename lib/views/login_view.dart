import 'dart:developer';

import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/custom_text_field.dart';
import 'home_view.dart';
import 'signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  'https://cdni.iconscout.com/illustration/premium/thumb/mobile-login-5650377-4707996.png',
                  width: 350,
                ),
                CustomTextField(
                  hintText: "Email",
                  controller: emailController,
                  validate: (email) {
                    if (!email!.contains('@') || !email.contains('.')) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Password",
                  isPassword: true,
                  controller: passwordController,
                  validate: (password) {
                    if (password!.length < 8) {
                      return "Password must be at least 8 charachters";
                    }
                    return null;
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.signup);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () => _login(context),
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else {
      _showSnackBar(
        context: context,
        contentText: 'Please enter valid credentials',
      );
    }
  }

  void _showSnackBar({
    required BuildContext context,
    Color bgColor = Colors.red,
    required String contentText,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: bgColor, content: Text(contentText)),
    );
  }
}
