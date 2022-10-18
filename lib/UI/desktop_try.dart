import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class DeskTry extends StatelessWidget {
  const DeskTry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 10; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Color.fromARGB(255, 255, 114, 161),
            height: 400,
          ),
        )
    ];
    return BottomNavigationBarTheme(
      data: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: AdaptiveScaffold(
        smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
        mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 100),
        largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
        useDrawer: false,
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.inbox), label: "Inbox"),
          NavigationDestination(icon: Icon(Icons.article), label: "Articles"),
          NavigationDestination(icon: Icon(Icons.chat), label: "Chat"),
          NavigationDestination(icon: Icon(Icons.video_call), label: "Video"),
        ],
        body: (context) => GridView.count(
          crossAxisCount: 2,
          children: children,
        ),
        smallBody: (context) => ListView.builder(
          itemCount: children.length,
          itemBuilder: ((context, index) => children[index]),
        ),
        secondaryBody: (context) => Container(
          color: Color.fromARGB(255, 255, 104, 93),
        ),
        smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      ),
    );
  }
}
