import 'package:flutter/material.dart';
import 'package:my_news_hub/screens/HomeScreen.dart';
import 'package:my_news_hub/screens/LoginScreen.dart';

void main() {
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
      home: LoginScreen(),
    );
  }
}
