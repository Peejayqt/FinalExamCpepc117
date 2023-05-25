import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    this.imageProvider,
    this.imageRadius = 0,
  });

  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 0,
        backgroundImage: imageProvider,
      ),
    );
  }
}
