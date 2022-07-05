import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key, required this.isDesktop}) : super(key: key);

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final ScrollController mobileController = ScrollController();
    final ScrollController desktopController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 600;

        return Scaffold(
          appBar:
              AppBar(title: Text(isDesktop ? 'Desktop View' : 'Mobile View')),
          backgroundColor: Colors.deepPurple[200],
          body: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MainVideo(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          key: UniqueKey(),
                          controller: mobileController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const VideoTile();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isDesktop)
                Expanded(
                  flex: 1,
                  child: LargeView(
                    controller: desktopController,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class MainVideo extends StatelessWidget {
  const MainVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        height: 250,
        color: Colors.deepPurple[400],
        child: const Center(
          child: Text('Current Video'),
        ),
      ),
    );
  }
}

class LargeView extends StatelessWidget {
  const LargeView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const VideoTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  const VideoTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(
        height: 120,
        color: Colors.deepPurple[300],
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.deepPurple[400],
                child: const Center(
                  child: Text('Video'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.deepPurple[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
