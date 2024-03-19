import 'package:calendar_scheduler/common/constants/gaps.md';
import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:flutter/material.dart';

class CardTime extends StatelessWidget {
  const CardTime({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final int startTime;

  final int endTime;

  @override
  Widget build(BuildContext context) {
    final widgetTextStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: Sizes.size16,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 시작 시간 표기 (ex. 07:00)
        Container(
          margin: const EdgeInsets.only(bottom: Sizes.size4),
          child: Text(
            '${startTime.toString().padLeft(2, '0')}:00',
            style: widgetTextStyle,
          ),
        ),

        /// 종료 시간 표기 (ex. 08:00)
        Text(
          '${endTime.toString().padLeft(2, '0')}:00',
          style: widgetTextStyle.copyWith(
            fontSize: Sizes.size10,
          ),
        ),
      ],
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
  });

  final int startTime;

  final int endTime;

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Sizes.size16,
        bottom: Sizes.size16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size8),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 시작 및 종료 시간 표기 위젯
              CardTime(
                startTime: startTime,
                endTime: endTime,
              ),
              Gaps.h16,

              /// 일정 내용 위젯
              CardContent(content: content),
              Gaps.h16,
            ],
          ),
        ),
      ),
    );
  }
}
