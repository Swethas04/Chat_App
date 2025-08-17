// ignore: file_names
import 'package:chat_app/Screens/loginScreen.dart';
import 'package:chat_app/Screens/registerScreen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginscreen(onTap: togglePages);
    } else {
      return Registerscreen(onTap:togglePages);
    }
  }
}
