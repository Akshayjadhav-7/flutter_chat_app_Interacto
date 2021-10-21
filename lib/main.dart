import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF1F1F1F),
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}


