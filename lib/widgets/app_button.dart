import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  //const AppButton({Key? key}) : super(key: key);
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  bool isIcon;
  String? text;
  IconData? icon;
  AppButton({
    this.text = "*",
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(icon),
            ),
    );
  }
}
