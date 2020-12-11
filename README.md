# Overlay

[![pub package](https://img.shields.io/pub/v/overlay.svg)](https://pub.dev/packages/overlay)
![Libraries.io dependency status for latest release](https://img.shields.io/librariesio/release/pub/overlay)
![License](https://img.shields.io/github/license/maddyb99/flutter_overlay)

This package can help you insert and remove multiple widgets into an overlay without having to manage them yourself.
It will also provide you with a simple method to close an overlay, if you wish to control that manually.

<!--## Examples-->

<!--An example can be found in the example directory of this repository.-->

<!--A list of detailed examples can be found in this [Examples Repository](https://github.com/maddyb99/shimmer_examples)-->

<!--|  Full Screen |  Individual Widgets |-->
<!--|---|---|-->
<!--|<img  height="500" src="https://github.com/maddyb99/shimmer_animation/blob/master/screenshots/shimmer.gif?raw=true">| <img height="500" src="https://github.com/maddyb99/shimmer_examples/blob/master/loading_cards/screenshots/shimmer.gif?raw=true">|-->

## How to use

Add `overlay` to `pubspec.yaml` of your project:

```yaml
dependencies:
  overlay: ^0.0.1
```

Import it in your Dart code:

```dart
import 'package:overlay/overlay.dart';
```
In any action or button, which triggers an overlay, call the constructor for the class CustomOverlay and pass the context and the widget

## The overlayWidget way:

```dart
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
```

## The builder way:

Builder passes a function removeOverlay as argument which can be used to manually remove the overlay

```dart
    MaterialButton(
      color: Colors.lightBlueAccent,
      child: Text('Use Overlay Builder'),
      // Call CustomOverlay Constructor in on pressed function
      onPressed: () => CustomOverlay(
        context: context,
        // Builder passes a function removeOverlay as argument which can be used to manually remove the overlay
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
```

## License

[MIT License](https://github.com/maddyb99/flutter_overlay/blob/master/LICENSE).

[Examples]: #examples

