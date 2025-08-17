import 'package:chat_app/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void logout() async {
    await authService.value.SignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_rounded)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 80),
                Image.asset('assets/chat_image.png', height: 300),
                SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Welcome back! Your friends are waiting — start a conversation.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.go('/chat');
                  },
                  child: Text("Start to chat"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
