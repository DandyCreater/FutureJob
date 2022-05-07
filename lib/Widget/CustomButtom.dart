import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() state;
  final double height;
  final double width;
  final Color color;

  CustomButton(
      {required this.title,
      required this.state,
      required this.height,
      required this.width,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: state,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66))),
      ),
    );
  }
}
