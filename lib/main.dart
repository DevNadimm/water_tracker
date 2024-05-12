import 'package:flutter/material.dart';
import 'package:water_tracker/home_screen.dart';

void main (){

  runApp(const MyApp());
}

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
      title: 'Water Tracker',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red, foregroundColor: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}
