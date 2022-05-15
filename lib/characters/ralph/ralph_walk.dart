import 'package:flutter/material.dart';

class RalphWalk extends StatefulWidget {
  double? scale;
  RalphWalk({Key? key, this.scale = 0.4}) : super(key: key);

  @override
  State<RalphWalk> createState() => _RalphWalkState();
}

class _RalphWalkState extends State<RalphWalk> {
  List<String> frames = [
    'assets/sprite/ralph/ralph_walk_1.png',
    'assets/sprite/ralph/ralph_walk_2.png',
  ];

  int currentFrameIndex = 0;

  @override
  Widget build(BuildContext context) {
// alternate between frames periodically every 500ms using Future.delayed
    return FutureBuilder<void>(
      future: Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          currentFrameIndex = (currentFrameIndex + 1) % frames.length;
        });
      }),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Image.asset(
          frames[currentFrameIndex],
          scale: widget.scale,
        );
      },
    );
  }
}
