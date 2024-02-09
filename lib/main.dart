import 'package:flutter/material.dart';
import 'package:sum_1/home_screen.dart';

void main(){
  runApp(SumApp());
}

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
