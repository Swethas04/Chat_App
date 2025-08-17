import 'package:chat_app/auth/auth_page.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  void logout() async {
    await authService.value.SignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_rounded)),
        ],
        
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: 400,
                height: 380,
                
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 239, 248),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        size: 30,),
                      title: Text(
                        "Notifications",
                        style: TextStyle(fontSize: 24,),),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {}, 
                    ),
                    Divider(thickness: 1, color: Colors.grey[700]),
                    SizedBox(height: 5,),
                    ListTile(
                      leading: Icon(Icons.shield
                      , size: 30),
                      title: Text(
                        "Privacy",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    Divider(thickness: 1, color: Colors.grey[700]),
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.block, size: 30),
                      title: Text(
                        "BlockedChat",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    Divider(thickness: 1, color: Colors.grey[700]),
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.cleaning_services_rounded, size: 30),
                      title: Text(
                        "ClearChat",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {}, 
                    ),
                    Divider(thickness: 1, color: Colors.grey[700]),
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.chrome_reader_mode_outlined, size: 30),
                      title: Text(
                        "Remainder",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {}, 
                    ),
                  ],
                )
              ),
              SizedBox(height: 25,),
              Text(
                "Support",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Container(
                width: 400,
                height: 155,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 239, 248),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.network_check_rounded, size: 30),
                      title: Text(
                        "Network Test",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {}, 
                    ),
                    Divider(thickness: 1, color: Colors.grey[700]),
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.error_outline_outlined, size: 30),
                      title: Text(
                        "About",
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {}, 
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  onPressed() {}
}
