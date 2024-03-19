import 'package:calendar_scheduler/common/constants/sizes.md';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.label,
    required this.timeSelected,
  });

  final String label;

  final bool timeSelected;

  @override
  Widget build(BuildContext context) {
    final widgetTextStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );

    return Container(
      margin: const EdgeInsets.all(Sizes.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: Sizes.size10,
              bottom: Sizes.size12,
            ),
            child: Text(
              label,
              style: widgetTextStyle,
            ),
          ),
          Expanded(
            flex: timeSelected ? 0 : 1,
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLines: timeSelected ? 1 : null,
              expands: !timeSelected,
              keyboardType:
              timeSelected ? TextInputType.number : TextInputType.multiline,
              textInputAction:
              timeSelected ? TextInputAction.next : TextInputAction.newline,
              inputFormatters:
              timeSelected ? [FilteringTextInputFormatter.digitsOnly] : [],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade300,
                suffixText: timeSelected ? '시' : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
