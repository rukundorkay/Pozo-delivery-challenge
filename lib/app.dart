import 'package:flutter/material.dart';
import 'package:pozo/screen/home_Screen.dart';

class PozoApp extends StatelessWidget {
  const PozoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PozoApp",
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name != '/home') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => const HomeScreen(),
    fullscreenDialog: true,
  );
}
