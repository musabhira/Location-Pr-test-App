import 'package:flutter/material.dart';
import 'package:test_app/view/home_page.dart';
import 'package:test_app/view/tab_view_page.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    const double phoneMaxWidth = 600;

    return Scaffold(
      body: MediaQuery.of(context).size.width <= phoneMaxWidth
          ? const HomePage()
          : const TabViewPage(),
    );
  }
}
