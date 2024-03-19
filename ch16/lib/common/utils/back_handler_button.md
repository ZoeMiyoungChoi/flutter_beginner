import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BackHandlerButton {
  BuildContext context;

  DateTime? lastPressed;

  BackHandlerButton({required this.context});

  Future<bool> onWillPop() async {
    var now = DateTime.now();

    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 3)) {
      lastPressed = now;

      Fluttertoast.showToast(
        msg: "'뒤로' 버튼을 한번 더 누르면 앱이 종료됩니다.",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );

      return Future.value(false);
    }

    return Future.value(true);
  }
}