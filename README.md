<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: This package help us to select time of day, allow us to select specific hours selectable and
minute interval this package is update on the
package [day_night_time_picker](https://pub.dev/packages/day_night_time_picker). We use this package
and modified the code to fit to select specific hours.

## Features

Help you to select specific hours selectable and minute interval.

## Getting started

No additional information to use package.
![My Image](/Users/rightwarellc/Documents/flutter-projects/interval_time_picker/screenshots/1.png)
## Usage

Longer examples find in `/example` folder.

```
Navigator.of(context).push(
          showPicker(
            workingHours: [0, 1, 9, 12, 11, 12, 13, 15, 19, 23],
            context: context,
            value: _time,
            minHour: 9,
            maxHour: 1,
            maxMinute: 55,
            minMinute: 0,
            onChange: onTimeChanged,
            minuteInterval: MinuteInterval.FIVE,
            maxMinuteAtMaximumHour: 0,
            minMinuteAtCurrentHour: 30,
            // Optional onChange to receive value as DateTime
            onChangeDateTime: (DateTime dateTime) {
              debugPrint("[debug datetime]:  $dateTime");
            },
          ),
        );
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to contribute to the
package, how to file issues, what response they can expect from the package authors, and more.
