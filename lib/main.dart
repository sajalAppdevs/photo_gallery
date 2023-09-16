import 'package:flutter/material.dart';
import 'package:photo_gallery/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: HomeScreeen(),
    );
  }
}
