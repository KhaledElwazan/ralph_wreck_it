import 'package:flutter/material.dart';

class RalphWreck extends StatefulWidget {
  double? scale;
  RalphWreck({Key? key, this.scale = 0.4}) : super(key: key);

  @override
  State<RalphWreck> createState() => _RalphWreckState();
}

class _RalphWreckState extends State<RalphWreck> {
  List<String> frames = [
    'assets/sprite/ralph/ralph_wreck_1.png',
    'assets/sprite/ralph/ralph_wreck_2.png',
    'assets/sprite/ralph/ralph_wreck_3.png',
    'assets/sprite/ralph/ralph_wreck_4.png',
  ];

  int currentFrameIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: Future.delayed(const Duration(milliseconds: 200), () {
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
