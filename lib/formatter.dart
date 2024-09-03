import 'package:intl/intl.dart';

final narrowWeekdayFormatter = DateFormat.EEEEE(); // "M" for "Monday"
final shortWeekdayFormatter = DateFormat.E(); // "Mon" for "Monday"
final longWeekdayFormatter = DateFormat.EEEE(); // "Monday"
final _shortDateFormatter = DateFormat('E, MMM d');
final _longDateFormatter = DateFormat.yMMMEd();
final _monthYearFormatter = DateFormat('MMMM yyyy');
final _monthFormatter = DateFormat.MMMM();
final _monthDayFormatter = DateFormat.MMMd();
final hour12TimeFormatter = DateFormat.jm();
final hour24TimeFormatter = DateFormat.Hm();

extension DateTimeExt on DateTime {
  String toNarrowWeekdayString() {
    return narrowWeekdayFormatter.format(this);
  }

  String toShortWeekdayString() {
    return shortWeekdayFormatter.format(this);
  }

  String toLongWeekdayString() {
    return longWeekdayFormatter.format(this);
  }

  String toLongDateString() {
    return _longDateFormatter.format(this);
  }

  String toMonthYearString() {
    return _monthYearFormatter.format(this);
  }

  String toMonthDayString() {
    return _monthDayFormatter.format(this);
  }

  String toWeekRangeString() {
    final firstDayOfWeek = subtract(Duration(days: weekday - 1));
    final lastDayOfWeek = add(Duration(days: 7 - weekday));

    if (firstDayOfWeek.month == lastDayOfWeek.month) {
      return '${_monthFormatter.format(this)} '
          '${firstDayOfWeek.day} - '
          '${lastDayOfWeek.day}';
    }

    return '${firstDayOfWeek.toMonthDayString()} - '
        '${lastDayOfWeek.toMonthDayString()}';
  }
}
