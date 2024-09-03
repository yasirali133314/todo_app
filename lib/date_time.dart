extension DateTimeExt on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }




  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  // Returns a new DateTime instance with hour, minute, second, and
  // millisecond set to zero.
  DateTime get startOfDay => DateTime(year, month, day);

  // Returns a new DateTime instance for the end of the day,
  // with hour set to 23, minute and second set to 59, and
  // millisecond set to 999.
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);
}
