import 'package:calendar_scheduler/common/constants/gaps.md';
import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:calendar_scheduler/common/utils/common_text_field.md';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  /// 작성 내용 저장
  void _onSavePressed() {}

  @override
  Widget build(BuildContext context) {
    final bottomInsect = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2 + bottomInsect,
        child: Padding(
          padding: EdgeInsets.only(
            left: Sizes.size10,
            right: Sizes.size10,
            top: Sizes.size10,
            bottom: bottomInsect,
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  /// 일정 시작
                  Expanded(
                    child: CommonTextField(
                      label: '시작 시간',
                      timeSelected: true,
                    ),
                  ),
                  Gaps.h16,

                  /// 일정 종료
                  Expanded(
                    child: CommonTextField(
                      label: '종료 시간',
                      timeSelected: true,
                    ),
                  ),
                ],
              ),
              Gaps.v10,

              /// 일정 내용
              const Expanded(
                child: CommonTextField(
                  label: '내용',
                  timeSelected: false,
                ),
              ),

              /// 작성 완료 Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSavePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    '작성 완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
