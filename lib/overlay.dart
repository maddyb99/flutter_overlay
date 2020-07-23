import 'dart:ui';

import 'package:flutter/material.dart';

class CustomOverlay {
  final BuildContext context;
  final Widget overlayCard;
  final Function builder;

  Function removeOverlay;
  OverlayEntry overlay, overlayBackground;

  CustomOverlay({this.context, this.overlayCard,this.builder}) {
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
    if(overlayCard!=null)
    overlay = OverlayEntry(
      builder: (context) => overlayCard,
    );
    else
      overlay = OverlayEntry(
        builder: (context) => builder(context,removeOverlay),
      );
    buildOverlay(context);
  }

  void buildOverlay(BuildContext context) {
    Overlay.of(context).insertAll([overlayBackground, overlay]);
  }
}
