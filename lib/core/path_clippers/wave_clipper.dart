import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const delta = 40;
    final height = size.height - 90;

    const double startingX = 0;
    final startingY = height;

    final double middleX = size.width / 2;
    final double middleY = height;

    final double finalX = size.width;
    final double finalY = height + 40;

    final double firstControlPointX = size.width / 4;
    final double firstControlPointY = height - delta;

    final double secondControlPointX = (3 * size.width) / 4;
    final double secondControlPointY = height + delta;

    final double bottomRightX = size.width;
    final double bottomRightY = size.height;

    const double bottomLeftX = 0;
    final double bottomLeftY = size.height;

    path.lineTo(
        startingX, startingY); // flipped from path.lineTo(0, size.height);

    path.quadraticBezierTo(
        firstControlPointX, firstControlPointY, middleX, middleY);

    path.quadraticBezierTo(secondControlPointX, secondControlPointY, finalX,
        finalY); // flipped from size.height

    path.lineTo(bottomRightX, bottomRightY);
    path.lineTo(bottomLeftX, bottomLeftY);
    path.lineTo(startingX, startingY);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
