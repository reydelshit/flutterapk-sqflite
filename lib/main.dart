import 'package:firstapk/pages/home_page.dart';
import 'package:firstapk/pages/login_page.dart';
import 'package:firstapk/pages/signup_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';

void main() {
  runApp((MaterialApp(
    title: 'Flutter App',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    routes: {
      AppConstants.loginPageRoute: (context) => LoginPage(),
      AppConstants.signUpPageRoute: (context) => SignupPage(),
      AppConstants.homePageRoute: (context) => const HomePage(),
    },
  )));
}
