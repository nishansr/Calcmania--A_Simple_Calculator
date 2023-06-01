import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcmania',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromARGB(255, 159, 142, 206),
        splash: Splash(),
        nextScreen: HomeScreen(),
      ),
    );
  }
}
