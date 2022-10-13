import 'package:app_ticket/screens/bottom_bar.dart';
import 'package:app_ticket/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
        primarySwatch: Colors.blue,
      ),
      home: const BottomBar(),
    );
  }
}
