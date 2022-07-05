import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.mobileView, required this.desktopView})
      : super(key: key);

  final Widget mobileView;
  final Widget desktopView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return (constraints.maxWidth < 600) ? mobileView : desktopView;
      },
    );
  }
}
