import 'package:flutter/material.dart';
import 'package:water_tracker/home_screen.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker',
      home: const HomeScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff7469B6),
            foregroundColor: Color(0xffFFE6E6)),

        // inputDecorationTheme: const InputDecorationTheme(
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(width: 1,color: Color(0xffAD88C6))
        //   )
        // )
      ),
    );
  }
}
