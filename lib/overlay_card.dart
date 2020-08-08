import 'package:flutter/material.dart';

class OverlayCard extends StatelessWidget {
  final Widget child;
  final Color color;

  OverlayCard({
    this.child,
    this.color: Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child,
      ],
    );
  }
}
