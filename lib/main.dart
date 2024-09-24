import 'package:arch_example/src/app_widget.dart';
import 'package:flutter/material.dart';

import 'src/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();
  runApp(const AppWidget());
}
