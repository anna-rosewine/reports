import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  bool isHovered;
  Function mouseEnter;
  Function mouseLeave;
  Animation<Color?> textColorAnimation;
  Animation<Color?> backgroundColorAnimation;
  Animation<double> heightAnimation;

  AnimationController animationController;

  AnimatedText({
    Key? key,
    required this.isHovered,
    required this.mouseEnter,
    required this.mouseLeave,
    required this.textColorAnimation,
    required this.backgroundColorAnimation,
    required this.heightAnimation,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return MouseRegion(
              onEnter: ((event) => mouseEnter()),
              onExit: ((event) => mouseLeave()),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: heightAnimation.value,
                decoration: BoxDecoration(
                  color: backgroundColorAnimation.value,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      spreadRadius: 5,
                      blurRadius: 12,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text('Text',
                    style: TextStyle(color: textColorAnimation.value)),
              ));
        });
  }
}
