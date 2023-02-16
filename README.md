## interval_time_selector

Interval time picker interval minutes, specific hour. This package help us to select time of day,
allow us to select specific hours selectable and minute interval this package is update on the
package [day_night_time_picker](https://pub.dev/packages/day_night_time_picker). We use this package
and modified the code to fit to select specific hours.

## Features

Help you to select specific hours selectable and minute interval.

## Screenshots

<a href="#screenshots">
<img src="https://github.com/MohamadAbdUlaziz938/interval-time-selector/blob/master/screenshots/1.png" width="200px">
</a>

## 💻 Installation

In the dependencies: section of your pubspec.yaml, add the following line:

```
interval_time_selector:<latest_version>
```

Import in your project

```
import 'package:interval_time_selector/show_time_picker/day_time_picker.dart';
```

## Usage

```
            Navigator.of(context).push(
                      showPicker(
                        workingHours: [0, 1, 9, 12, 11, 12, 13, 15, 19, 23],
                        context: context,
                        value: _time,
                        ascending: true,
                        onChange: onTimeChanged,
                        maxMinuteAtMaximumHour: 40,
                        minMinuteAtMinimumHour: 20,
                        onChangeDateTime: (DateTime dateTime) {
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
           );
```

Longer examples find in `/example`
folder [example](https://github.com/MohamadAbdUlaziz938/interval-time-selector/tree/master/example).

## 👨 Updated By

Mohamad Abd-Ulaziz [Mail](mohamad.samer.abdulaziz@gmail.com)

## Getting started

For help getting started with Flutter, view our
online [documentation](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
.


