import 'package:flutter/material.dart';
import 'package:reports/animatedText.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> textColorAnimation;
  late Animation<Color?> backgroundColorAnimation;
  late Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    heightAnimation = Tween<double>(begin: 100, end: 200).animate(_controller);
    textColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(_controller);
    backgroundColorAnimation =
        ColorTween(begin: Colors.white, end: Colors.black).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  __mouseEnter() {
    print('enter');
    _controller.forward();
  }

  _mouseExit() {
    print('exit');

    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedText(
                backgroundColorAnimation: backgroundColorAnimation,
                textColorAnimation: textColorAnimation,
                heightAnimation: heightAnimation,
                animationController: _controller,
                mouseEnter: __mouseEnter,
                mouseLeave: _mouseExit,
                isHovered: false,
              )
            ],
          )
        ],
      )),
    );
  }
}
