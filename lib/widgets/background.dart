import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;
  const MainBackground({
    required this.leftChild,
    required this.rightChild,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          width: MediaQuery.of(context).size.width * 0.55,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150),
                bottomLeft: Radius.circular(150),
              ),
            ),
          ),
        ),
        // Left Content
        Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: leftChild,
            ),
        ),
        ),
        // Right Content
        Positioned(
        right: 0,
        top: 0,
        bottom: 0,
        width: MediaQuery.of(context).size.width * 0.55,
        child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: rightChild,
            ),
        ),
        ),
      ],
    );
  }
}