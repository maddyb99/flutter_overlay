import 'package:example/overlays/legal_overlay.dart';
import 'package:flutter/material.dart';
import 'package:overlay/overlay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('Use Overlay Widget'),
              // Call CustomOverlay Constructor in on pressed function
              onPressed: () => CustomOverlay(
                context: context,
                // Using overlayWidget
                overlayWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                          'This widget is passed to the overlay using overlayWidget so there is no close button, but you can always close this overlay by tapping anywhere in the darker areas.'),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('Use Overlay Builder'),
              // Call CustomOverlay Constructor in on pressed function
              onPressed: () => CustomOverlay(
                context: context,
                // Builder passes aa function removeOverlay as argument which can be used to manually remove the overlay
                builder: (removeOverlay) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'This widget is passed to the overlay using the builder method so there is a close button, but you can also close this overlay by tapping anywhere in the darker areas.',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                  onPressed: removeOverlay,
                                  child: Text('Close'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('About App'),
              onPressed: () => CustomOverlay(
                context: context,
                builder: (removeOverlay) => LegalOverlay(removeOverlay),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomOverlay(
          context: context,
          builder: (removeOverlay) => LegalOverlay(removeOverlay),
        ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
