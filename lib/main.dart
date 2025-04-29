import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // We will create this next!

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: SplashScreen(), // Start at Splash Screen
    );
  }
}
