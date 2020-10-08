import 'package:calendarro/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:calendarro/calendarro.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Container(
          height: 20,
        ),
        Calendarro(
            displayMode: DisplayMode.MONTHS,
            startDate: DateUtils.getFirstDayOfCurrentMonth(),
            endDate: DateUtils.getLastDayOfCurrentMonth()),
        Container(
          child: Center(
            child: Text('CalendarScreen'),
          ),
        ),
      ]),
    );
  }
}
