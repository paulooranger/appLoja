import 'package:apploja/tabs/home_tab.dart';
import 'package:apploja/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: const HomeTab(),
          drawer: CustomDrawer(pageController),
        )
      ],
    );
  }
}
