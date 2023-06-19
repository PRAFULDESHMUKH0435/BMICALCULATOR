import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

Color backcolor = Color(0xFFFFFFFF);

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: HomePage());
  }
}
