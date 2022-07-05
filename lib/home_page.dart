import 'package:flutter/material.dart';
import 'package:responsive_ui/main_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainView(isDesktop: false),
      // uncomment to see other nice ways of implementing this feature
      // body: ResponsiveLayout(
      //   mobileView: MobileView(),
      //   desktopView: DesktopView(),
      // ),
    );
  }
}
