import 'package:flutter/material.dart';

class RightContent extends StatelessWidget {
  final bool isActive;

  const RightContent({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Break Every Hour',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}