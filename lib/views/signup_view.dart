import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';

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
                CustomTextField(
                  hintText: "Confirm Password",
                  isPassword: true,
                  controller: confirmPasswordController,
                  validate: (confirmPassword) {
                    if (confirmPassword != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Phone Number",
                  controller: phoneController,
                  validate: (phone) {
                    if (phone!.startsWith('05')) return null;
                    return "Enter a valid phone number";
                  },
                ),

                // TextButton(
                //   onPressed: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => LoginView()),
                //     );
                //   },
                //   child: Text('You have an account? Sign In'),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
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
                    _signUp(context);
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

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(
        context,
        Routes.home,
        arguments: nameController.text,
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
