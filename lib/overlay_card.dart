import 'package:flutter/material.dart';
import 'package:goodnewsapp/common/ui/custom_card.dart';

class OverlayCard extends StatelessWidget {
  final Widget child;

  OverlayCard({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          margin: 10,
          child: child,
        ),
      ],
    );
  }
}
