import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_setup/firebase_options.dart';
import 'package:scholar_chat_setup/pages/chat_page.dart';
import 'package:scholar_chat_setup/pages/login_page.dart';
import 'package:scholar_chat_setup/pages/register_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      routes: 
      {
        "LoginPage" : (context) => LoginPage(),
        "RegisterPage" : (context) => RegisterPage(),
        "ChatPage" : (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Scholar Chat',
      initialRoute: 'LoginPage',
    );
  }
}
