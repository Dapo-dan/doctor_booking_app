import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay{
  toCustomString(){
    String period = this.period == DayPeriod.am ? 'AM' : 'PM';

    return '${hourOfPeriod.toString().padLeft(2,'0',)}:${minute.toString().padLeft(2,'0')} $period';
  }
}