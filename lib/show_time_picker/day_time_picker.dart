import 'package:flutter/material.dart';
import 'package:interval_time_selector/show_time_picker/utils/utils.dart';

import 'state/state_container.dart';
import 'state/time.dart';
import 'utils/constant.dart';
import 'widgets/android_builder/day_time_picker_android.dart';

PageRouteBuilder showPicker({
  BuildContext? context,
  required TimeOfDay value,
  required List<int> workingHours,
  required void Function(TimeOfDay) onChange,
  void Function(DateTime)? onChangeDateTime,
  void Function()? onCancel,
  bool is24HrFormat = false,
  Color? accentColor,
  Color? unselectedColor,
  String cancelText = "Cancel",
  String okText = "Ok",
  Image? sunAsset,
  Image? moonAsset,
  bool blurredBackground = false,
  bool ltrMode = true,
  Color barrierColor = Colors.black45,
  double? borderRadius,
  double? elevation,
  EdgeInsets? dialogInsetPadding =
      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  bool barrierDismissible = true,
  bool iosStylePicker = false,
  bool displayHeader = true,
  String hourLabel = 'hours',
  String minuteLabel = 'minutes',
  bool disableMinute = false,
  bool disableHour = false,
  double minMinuteAtMinimumHour = 0,
  double maxMinuteAtMaximumHour = 0,
  bool ascending = true,
  ThemeData? themeData,
  bool focusMinutePicker = false,
  TextStyle okStyle = const TextStyle(fontWeight: FontWeight.bold),
  TextStyle cancelStyle = const TextStyle(fontWeight: FontWeight.bold),
  ButtonStyle? buttonStyle,
  ButtonStyle? cancelButtonStyle,
  double? buttonsSpacing,
}) {
  assert((workingHours.isNotEmpty), "Working must be not empty");
  assert((minMinuteAtMinimumHour >= 0),
      "minMinuteAtCurrentHour must be equal or greater than zero");

  assert((maxMinuteAtMaximumHour >= 0),
      "maxMinuteAtMaximumHour must be equal or greater than zero");
  assert(!(disableHour == true && disableMinute == true),
      "Both \"disableMinute\" and \"disableHour\" cannot be true.");

  assert(!(disableMinute == true && focusMinutePicker == true),
      "Both \"disableMinute\" and \"focusMinutePicker\" cannot be true.");

  /// sort working hours - select max hour, min hour
  double minHour;
  double maxHour;
  if (ascending) {
    workingHours.sort();
    minHour = workingHours.first.toDouble();
    maxHour = workingHours.last.toDouble();
  } else {
    workingHours.sort(
      (a, b) => b.compareTo(a),
    );

    minHour = workingHours.first.toDouble();
    maxHour = workingHours.last.toDouble();
  }
  final selectedTimeValue = Time.fromTimeOfDay(value);

  return PageRouteBuilder(
    pageBuilder: (context, _, __) {
      {
        return Theme(
          data: themeData ?? Theme.of(context),
          child: const DayNightTimePickerAndroid(),
        );
      }
    },
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, anim, secondAnim, child) => SlideTransition(
      position: anim.drive(
        Tween(
          begin: const Offset(0, 0.15),
          end: const Offset(0, 0),
        ).chain(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: FadeTransition(
        opacity: anim,
        child: TimeModelBinding(
          workingHours: workingHours,
          maxMinuteAtMaximumHour: maxMinuteAtMaximumHour,
          minMinuteAtMinimumHour: minMinuteAtMinimumHour,
          selectedTime: selectedTimeValue,
          isInlineWidget: false,
          onChange: onChange,
          onChangeDateTime: onChangeDateTime,
          onCancel: onCancel,
          is24HrFormat: is24HrFormat,
          displayHeader: displayHeader,
          accentColor: accentColor,
          unselectedColor: unselectedColor,
          cancelText: cancelText,
          okText: okText,
          sunAsset: sunAsset,
          moonAsset: moonAsset,
          blurredBackground: blurredBackground,
          borderRadius: borderRadius,
          elevation: elevation,
          dialogInsetPadding: dialogInsetPadding,
          minuteInterval: MinuteInterval.FIVE,
          disableMinute: disableMinute,
          disableHour: disableHour,
          maxHour: maxHour,
          minHour: minHour,
          focusMinutePicker: focusMinutePicker,
          okStyle: okStyle,
          cancelStyle: cancelStyle,
          buttonStyle: buttonStyle,
          cancelButtonStyle: cancelButtonStyle,
          buttonsSpacing: buttonsSpacing,
          hourLabel: hourLabel,
          minuteLabel: minuteLabel,
          ltrMode: ltrMode,
          child: child,
        ),
      ),
    ),
    barrierDismissible: barrierDismissible,
    opaque: false,
    barrierColor: barrierColor,
  );
}

Widget createInlinePicker({
  BuildContext? context,
  void Function(DateTime)? onChangeDateTime,
  required TimeOfDay value,
  required void Function(TimeOfDay) onChange,
  void Function()? onCancel,
  bool is24HrFormat = false,
  Color? accentColor,
  Color? unselectedColor,
  String cancelText = "Cancel",
  String okText = "Ok",
  bool isOnChangeValueMode = false,
  bool ltrMode = true,
  Image? sunAsset,
  Image? moonAsset,
  bool blurredBackground = false,
  Color barrierColor = Colors.black45,
  double? borderRadius,
  double? elevation,
  EdgeInsets? dialogInsetPadding =
      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  bool barrierDismissible = true,
  bool iosStylePicker = false,
  String hourLabel = 'hours',
  String minuteLabel = 'minutes',
  bool disableMinute = false,
  bool disableHour = false,
  bool displayHeader = true,
  ThemeData? themeData,
  bool focusMinutePicker = false,
  bool ascending = true,
  // Infinity is used so that we can assert whether or not the user actually set a value
  double minHour = double.infinity,
  double minMinuteAtMinimumHour = 0,
  double maxHour = double.infinity,
  required List<int> workingHours,
  TextStyle okStyle = const TextStyle(fontWeight: FontWeight.bold),
  TextStyle cancelStyle = const TextStyle(fontWeight: FontWeight.bold),
  ButtonStyle? buttonStyle,
  ButtonStyle? cancelButtonStyle,
  double maxMinuteAtMaximumHour = 0,
  double? buttonsSpacing,
}) {
  assert((workingHours.isNotEmpty), "Working must be not empty");
  assert((minMinuteAtMinimumHour >= 0),
      "minMinuteAtCurrentHour must be equal or greater than zero");

  assert((maxMinuteAtMaximumHour >= 0),
      "maxMinuteAtMaximumHour must be equal or greater than zero");
  assert(!(disableHour == true && disableMinute == true),
      "Both \"disableMinute\" and \"disableHour\" cannot be true.");

  assert(!(disableMinute == true && focusMinutePicker == true),
      "Both \"disableMinute\" and \"focusMinutePicker\" cannot be true.");

  /// sort working hours - select max hour, min hour
  double minHour;
  double maxHour;
  if (ascending) {
    workingHours.sort();
    minHour = workingHours.first.toDouble();
    maxHour = workingHours.last.toDouble();
  } else {
    workingHours.sort(
      (a, b) => b.compareTo(a),
    );

    minHour = workingHours.first.toDouble();
    maxHour = workingHours.last.toDouble();
  }
  final selectedTimeValue = Time.fromTimeOfDay(value);
  return TimeModelBinding(
    workingHours: ascending
        ? (workingHours..sort())
        : (workingHours
          ..sort(
            (a, b) => b.compareTo(a),
          )),
    maxMinuteAtMaximumHour: maxMinuteAtMaximumHour,
    minMinuteAtMinimumHour: minMinuteAtMinimumHour,
    onChange: onChange,
    selectedTime: selectedTimeValue,
    onChangeDateTime: onChangeDateTime,
    onCancel: onCancel,
    is24HrFormat: is24HrFormat,
    accentColor: accentColor,
    unselectedColor: unselectedColor,
    cancelText: cancelText,
    okText: okText,
    sunAsset: sunAsset,
    moonAsset: moonAsset,
    blurredBackground: blurredBackground,
    borderRadius: borderRadius,
    elevation: elevation,
    dialogInsetPadding: dialogInsetPadding,
    minuteInterval: MinuteInterval.FIVE,
    disableMinute: disableMinute,
    disableHour: disableHour,
    maxHour: maxHour,
    minHour: minHour,
    isInlineWidget: true,
    displayHeader: displayHeader,
    isOnValueChangeMode: isOnChangeValueMode,
    focusMinutePicker: focusMinutePicker,
    okStyle: okStyle,
    cancelStyle: cancelStyle,
    hourLabel: hourLabel,
    minuteLabel: minuteLabel,
    buttonStyle: buttonStyle,
    cancelButtonStyle: cancelButtonStyle,
    buttonsSpacing: buttonsSpacing,
    ltrMode: ltrMode,
    child: Builder(
      builder: (context) {
        {
          return Builder(
            builder: (context) {
              return Theme(
                data: themeData ?? Theme.of(context),
                child: const DayNightTimePickerAndroid(),
              );
            },
          );
        }
      },
    ),
  );
}
