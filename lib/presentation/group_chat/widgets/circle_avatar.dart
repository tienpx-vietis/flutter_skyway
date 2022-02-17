import 'package:flutter/material.dart';

class CircleThumbAvatar extends StatelessWidget {
  const CircleThumbAvatar(
      {Key? key,
      required this.color,
      this.width = 33,
      this.height = 33,
      this.padding = 2,
      required this.avatar})
      : super(key: key);
  final Color color;
  final double width;
  final double height;
  final double padding;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            image:
                DecorationImage(image: AssetImage(avatar), fit: BoxFit.cover)),
      ),
    );
  }
}
