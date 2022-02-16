import 'package:flutter/material.dart';

class CircleThumbAvatar extends StatelessWidget {
  const CircleThumbAvatar(
      {Key? key,
      required this.color,
      this.width = 33,
      this.height = 33,
      this.padding = 3})
      : super(key: key);
  final Color color;
  final double width;
  final double height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
