import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  //const AppLargeText({ Key? key }) : super(key: key);
  double size;
  final Color color;
  final String text;
  AppLargeText({
    required this.text,
    this.color = Colors.black,
    this.size = 30,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
