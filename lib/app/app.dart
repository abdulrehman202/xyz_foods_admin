import 'package:flutter/material.dart';
import 'package:xyz_foods_admin/presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.initialRoute,
    );
  }
}
