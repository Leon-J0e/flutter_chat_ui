import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.red,
            onPrimary: Colors.white,
            secondary: Color(0xFFFEF9EB),
            onSecondary: Colors.blue,
            error: Colors.blue,
            onError: Colors.blue,
            background: Colors.red,
            onBackground: Colors.blue,
            surface: Colors.blue,
            onSurface: Colors.red),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
