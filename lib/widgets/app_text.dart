import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  //const AppLargeText({ Key? key }) : super(key: key);
  double size;
  final Color color;
  final String text;
  AppText({
    required this.text,
    this.color = Colors.black54,
    this.size = 14,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
