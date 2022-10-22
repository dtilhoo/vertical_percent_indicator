Package that allows you to display linear progress widget based on percentage. Customize the animation duration and color on will. Simple and easy to use.

## Features

![ripple](https://user-images.githubusercontent.com/56429814/190866156-fe18e105-3215-49c6-b150-ba3d1bdaf018.gif)

<img src="https://user-images.githubusercontent.com/56429814/187089068-fb9b6b67-292e-430c-aa73-00e2ec38c26e.png" width="250" height="600">

## Installing

Add vertical_percent_indicator to your pubspec.yaml file.

```yaml
dependencies:
  vertical_percent_indicator:
```

Import vertical_percent_indicator in files that it will be used.

```dart
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
```

## Usage

```dart
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vertical Percent Indicator'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const VerticalBarIndicator(
              percent: 0.9,
              header: '90%',
              footer: '2019',
            ),
            const VerticalBarIndicator(
              percent: 0.5,
              header: '50%',
              height: 200,
              width: 30,
              color: [
                Colors.indigo,
                Colors.teal,
              ],
              footer: 'Task\ncompleted',
            ),
            VerticalBarIndicator(
              percent: 1,
              header: 'Speed',
              color: [
                Colors.blue.withOpacity(0.5),
                Colors.blue,
              ],
              circularRadius: 0,
            ),
            const VerticalBarIndicator(
              percent: 0.95,
              height: 250,
              animationDuration: Duration(seconds: 1),
              circularRadius: 0,
              color: [
                Colors.limeAccent,
                Colors.green,
              ],
              width: 50,
              header: '95%',
              footer: 'Available',
            ),
          ],
        ),
      ),
    );
  }
}
```
