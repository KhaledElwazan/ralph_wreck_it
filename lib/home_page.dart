import 'package:flutter/material.dart';

import 'characters/ralph/ralph_idle.dart';
import 'characters/ralph/ralph_walk.dart';
import 'characters/ralph/ralph_wreck.dart';

enum RalphState { idle, walk, wreck }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RalphState ralphState = RalphState.idle;

  Map<RalphState, Widget> ralphAnimation = {
    RalphState.idle: RalphIdle(),
    RalphState.walk: RalphWalk(),
    RalphState.wreck: RalphWreck(),
  };

  double ralphXAxis = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/background.jpeg',
                  fit: BoxFit.fill,
                  height: double.infinity,
                ),
                Positioned(
                  child: ralphAnimation[ralphState] ?? Container(),
                  bottom: 0,
                  left: ralphXAxis,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.red,
            child: Row(
              children: [
                GestureDetector(
                  onTapDown: ((details) {
                    setState(() {
                      ralphState = RalphState.walk;
                      ralphXAxis = ralphXAxis + 10;
                      print(ralphXAxis);
                    });
                  }),
                  onTapUp: ((details) {
                    setState(() {
                      ralphState = RalphState.idle;
                    });
                  }),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTapDown: ((details) {
                    setState(() {
                      ralphState = RalphState.wreck;
                    });
                  }),
                  onTapUp: ((details) {
                    setState(() {
                      ralphState = RalphState.idle;
                    });
                  }),
                  child: const Text(
                    'W',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
