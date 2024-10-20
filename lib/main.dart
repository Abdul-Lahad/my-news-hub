import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_news_hub/firebase_options.dart';
import 'package:my_news_hub/screens/HomeScreen.dart';
import 'package:my_news_hub/screens/LoginScreen.dart';
import 'package:my_news_hub/screens/SignupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // For Web Initialization
  );
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
      // home: SignupScreen(),
      home: LoginScreen(),
    );
  }
}
