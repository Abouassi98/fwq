import 'package:flutter/material.dart';
import 'package:graduation_project/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
  runApp(
    MyApp(navigator: navigator),
  );
}
