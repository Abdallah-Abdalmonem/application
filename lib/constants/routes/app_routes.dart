import 'package:application/presentation/nineteen_screen/nineteen_screen.dart';
import 'package:application/presentation/twenty_screen/twenty_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String nineteenScreen = '/nineteen_screen';

  static const String twentyScreen = '/twenty_screen';

  static Map<String, WidgetBuilder> routes = {
    nineteenScreen: (context) => NineteenScreen(),
    twentyScreen: (context) => TwentyScreen(),
  };
}
