import 'package:flutter/material.dart';

class RalphIdle extends StatelessWidget {
  double? scale;
  RalphIdle({Key? key, this.scale = 0.4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/sprite/ralph/ralph_idle.png',
      scale: scale,
    );
  }
}
