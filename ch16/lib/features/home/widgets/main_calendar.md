import 'package:calendar_scheduler/common/constants/colors.md';
import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  const MainCalendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDate,
  });

  final OnDaySelected onDaySelected;

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_kr',
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w700,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          color: light,
          borderRadius: BorderRadius.circular(Sizes.size6),
        ),
        weekendDecoration: BoxDecoration(
          color: light,
          borderRadius: BorderRadius.circular(Sizes.size6),
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size6),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        defaultTextStyle: TextStyle(
          color: dark,
          fontWeight: FontWeight.w600,
        ),
        weekendTextStyle: const TextStyle(
          color: Color(0xFFFF80AB),
          fontWeight: FontWeight.w600,
        ),
        selectedTextStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
      date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
    );
  }
}
