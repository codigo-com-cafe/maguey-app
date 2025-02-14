import 'package:flutter/material.dart';

import 'helpers.dart';

class AppRoutes {
  static void push(BuildContext context, Widget page, {bool opaque = true}) {
    Helper.closeKeyboard(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pushWithThen(BuildContext context, Widget page, Function() thenFunction, {bool opaque = true}) {
    Helper.closeKeyboard(context);
    Navigator.of(context).push(PageRouteBuilder(opaque: opaque, pageBuilder: (BuildContext context, _, __) => page)).then((value) {
      thenFunction();
    });
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void makeFirst(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }
}
