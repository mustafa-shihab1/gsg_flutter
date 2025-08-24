import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import 'home_view.dart';
import 'login_view.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  'https://cdni.iconscout.com/illustration/premium/thumb/mobile-login-5650377-4707996.png',
                ),
                CustomTextField(hintText: "Name", controller: nameController),
                CustomTextField(hintText: "Email", controller: emailController),
                CustomTextField(
                  hintText: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                CustomTextField(
                  hintText: "Confirm Password",
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
                CustomTextField(
                  hintText: "Phone Number",
                  controller: phoneController,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: Text('You have an account? Sign In'),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () {
                    _login(context);
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    var email = emailController.text;
    var password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(
        context: context,
        contentText: 'Please enter valid credentials',
      );
    } else if (email.contains('@') && email.contains('.')) {
      if (password.length >= 8) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        emailController.clear();
        passwordController.clear();
      } else {
        _showSnackBar(
          context: context,
          contentText: 'Password must be at least 8 chars',
        );
      }
    } else {
      _showSnackBar(context: context, contentText: 'Please enter valid email');
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
