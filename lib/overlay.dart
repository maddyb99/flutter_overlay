import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'overlay_card.dart';

class CustomOverlay{

  Function removeOverlay;
  OverlayEntry overlay, overlayBackground;

  final BuildContext context;
  CustomOverlay({this.context}){
    removeOverlay=(context) {
      overlayBackground.remove();
      overlay.remove();
      Navigator.of(context).setState(() { });
    };
    overlayBackground=OverlayEntry(
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
    overlay=OverlayEntry(
      builder: (context) => OverlayCard(
        imageUrl: 'https://content.presspage.com/uploads/1376/c1920_hotairballoonride-cappadocia.jpg?59012',
        contentPreview:
        "pee pee poo poopee pee poo poo pee pee poo poo pee pee poo poo pee pee poo poo pee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poopee pee poo poo",
        title: "What this cat do",
        oArticleURL: "https://google.com",
      ),
    );
    buildOverlay(context);
  }

  void buildOverlay(BuildContext context) {
    Overlay.of(context).insertAll([overlayBackground,overlay]);
  }
}