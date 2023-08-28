// ignore_for_file: file_names

import 'package:apploja/tabs/home_tab.dart';
import 'package:apploja/tabs/produtos_tab.dart';
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
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Produtos"),
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            //backgroundColor: const Color.fromARGB(255, 211, 118, 130),
          ),
          drawer: CustomDrawer(pageController),
          body: const ProdutosTab(),
        )
      ],
    );
  }
}
