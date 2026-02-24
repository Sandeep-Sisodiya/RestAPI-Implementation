import 'package:api_tutorials/example2.dart';
import 'package:api_tutorials/example3.dart';
import 'package:api_tutorials/example4.dart';
import 'package:api_tutorials/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // Explicitly set the AppBar color
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue, // Button color matches the theme
          textTheme: ButtonTextTheme.primary,
        ),


      ),
      home: const ExampleFour(),
    );
  }
}
