import 'package:chat_app/Screens/chats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No contacts found.'));
          }

          final users =
              snapshot.data!.docs
                  .where((doc) => doc.id != currentUserId)
                  .toList();

          if (users.isEmpty) {
            return const Center(child: Text('No other users found.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var selectedUser = users[index];
              final userName =
                  selectedUser['name'] ??
                  selectedUser['email'] ??
                  'Unnamed User';

              return ListTile(
                leading: CircleAvatar(child: Text(userName[0].toUpperCase())),
                title: Text(userName),
                subtitle: Text(selectedUser['email'] ?? ''),
                onTap: () {
                  final chatId = generateChatId(currentUserId, selectedUser.id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ChatScreen(
                            chatId: chatId,
                            chatUserName: userName,
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
  
  String generateChatId(String uid1, String uid2) {
    return (uid1.compareTo(uid2) < 0) ? '${uid1}_$uid2' : '${uid2}_$uid1';
  }

}
