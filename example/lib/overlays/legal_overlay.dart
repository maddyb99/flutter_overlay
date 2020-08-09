import 'package:flutter/material.dart';

class LegalOverlay extends StatelessWidget {
  final Function removeOverlay;

  LegalOverlay(this.removeOverlay);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.settings_overscan,
                        size: 80,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Overlay Example",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24),
                        ),
                        Text("v0.0.1"),
                        Text(
                            "Happy News For You. \nYour Positive Stories For The World."),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    removeOverlay();
                    showLicensePage(context: context);
                  },
                  child: Text("Legal"),
                ),
                FlatButton(
                  onPressed: () => removeOverlay(),
                  child: Text("Close"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
