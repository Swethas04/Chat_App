import 'package:chat_app/auth/loginorRegister.dart';
import 'package:chat_app/router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget? pageIfNotConnected;

  const AuthLayout({super.key, this.pageIfNotConnected});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return MaterialApp.router(
            routerConfig: bottomNavRouter,
            debugShowCheckedModeBanner: false
            );
        } else {
          
          return pageIfNotConnected ?? LoginOrRegister();
        }
      },
    );
  }
}
