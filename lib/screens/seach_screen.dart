import 'package:app_ticket/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Text(
            'What are\n you looking for?',
            style: Styles.headLineStyle1.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
