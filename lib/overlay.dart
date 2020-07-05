import 'dart:ui';

import 'package:flutter/material.dart';

class CustomOverlay {
  final BuildContext context;
  final Widget overlayCard;

  Function removeOverlay;
  OverlayEntry overlay, overlayBackground;
  CustomOverlay({this.context, this.overlayCard}) {
    removeOverlay = (context) {
      overlayBackground.remove();
      overlay.remove();
//      Navigator.of(context).setState(() {});
    };
    overlayBackground = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: () => removeOverlay(context),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
    overlay = OverlayEntry(
      builder: (context) => overlayCard,
    );
    buildOverlay(context);
  }

  void buildOverlay(BuildContext context) {
    Overlay.of(context).insertAll([overlayBackground, overlay]);
  }
}
