import 'package:flutter/material.dart';
import 'package:test_app/view/grid_view_page.dart';
import 'package:test_app/view/responseive_page.dart';
import 'package:test_app/view/tab_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveScaffold(),
    );
  }
}
