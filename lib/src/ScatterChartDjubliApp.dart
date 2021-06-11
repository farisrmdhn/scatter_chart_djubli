// Packages
import 'package:flutter/material.dart';

// Screens
import 'screens/MainScreen.dart';

class ScatterChartDjubliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Djubli',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins'
      ),
      home: MainScreen(),
    );
  }
}