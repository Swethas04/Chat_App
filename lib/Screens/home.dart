import 'package:chat_app/Screens/chat_list.dart';
import 'package:chat_app/Screens/settings.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            icon: Icon(Icons.settings),
          ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatList()),
                    );
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
