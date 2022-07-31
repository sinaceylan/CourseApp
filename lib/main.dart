import 'package:flutter/material.dart';
import 'package:project2/screen/class_detail_screen.dart';
import 'package:project2/screen/home_screen/home_screen.dart';
import 'package:project2/screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff29274F),
      ),
      home: HomeScreen(),
    );
  }
}

