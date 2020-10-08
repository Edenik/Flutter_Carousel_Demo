import 'package:flutter/material.dart';
import 'package:flutter_carousel_demo/screens/carousel_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel Demo',
      home: CarouselScreen(),
    );
  }
}
