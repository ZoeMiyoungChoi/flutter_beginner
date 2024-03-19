// ignore_for_file: deprecated_member_use

import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:calendar_scheduler/common/utils/back_handler_button.md';
import 'package:calendar_scheduler/features/home/widgets/main_calendar.dart';
import 'package:calendar_scheduler/features/home/widgets/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/features/home/widgets/schedule_card.dart';
import 'package:calendar_scheduler/features/home/widgets/today_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// 뒤로가기 Action
  BackHandlerButton? backHandlerButton;

  /// 선택된 날짜 객체 생성
  DateTime thisSelectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();

    backHandlerButton = BackHandlerButton(context: context);
  }

  /// 선택된 날짜 Handling
  void _onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      thisSelectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (backHandlerButton != null) {
          return backHandlerButton!.onWillPop();
        }

        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(Sizes.size20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 달력
                MainCalendar(
                  onDaySelected: _onDaySelected,
                  selectedDate: thisSelectedDate,
                ),

                /// 오늘 일자
                TodayBanner(
                  selectedDate: thisSelectedDate,
                  count: 0,
                ),

                /// 오늘 일정
                const ScheduleCard(
                  startTime: 13,
                  endTime: 15,
                  content: 'Flutter 공부!',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: const ScheduleBottomSheet(),
                );
              },
              isScrollControlled: true,
              isDismissible: true,
            );
          },
          child: const Icon(
            color: Colors.white,
            Icons.add,
            size: Sizes.size32,
          ),
        ),
      ),
    );
  }
}
