import 'package:flutter/material.dart';
import 'package:goodnewsapp/common/ui/custom_card.dart';

class OverlayCard extends StatelessWidget {
  final Widget child;
  final Color color;

  OverlayCard({
    this.child,
    this.color:Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          color:color,
          margin: 10,
          child: child,
        ),
      ],
    );
  }
}
