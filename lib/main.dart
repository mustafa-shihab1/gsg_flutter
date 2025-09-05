import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/views/login_view.dart';
import 'package:gsg_flutter/views/signup_view.dart';
import 'package:gsg_flutter/views/test_view.dart';
import 'views/freelancer_details.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TestView(),
      routes: {
        Routes.home: (context) => HomeView(),
        Routes.login: (context) => LoginView(),
        Routes.signup: (context) => SignupView(),
        Routes.freelancerDetails: (context) => FreelancerDetails(),
      },
    );
  }
}
