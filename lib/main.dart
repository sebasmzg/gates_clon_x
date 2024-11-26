import 'package:clone_x/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter X Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
          tabBarTheme: const TabBarTheme(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              )
            )
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black45,
          ),
      ),

      home: const HomeScreen(),
    );
  }
}
