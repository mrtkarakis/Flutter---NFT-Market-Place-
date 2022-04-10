import 'package:flutter/material.dart';

class OnBoradingCounter extends StatefulWidget {
  final int index;
  const OnBoradingCounter({Key? key, required this.index}) : super(key: key);

  @override
  State<OnBoradingCounter> createState() => _OnBoardingCounterState();
}

class _OnBoardingCounterState extends State<OnBoradingCounter> {
  int animationPage = -1;
  bool leftToRight = false;

  @override
  Widget build(BuildContext context) {
    bool animation = animationPage != widget.index;
    if (animationPage < widget.index) {
      leftToRight = true;
    } else {
      leftToRight = false;
    }

    animationPage = widget.index;
    return SizedBox(
      width: 42 * 4,
      height: 8,
      child: ListView.builder(
          itemCount: 4,
          itemExtent: 42,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.decelerate,
                  color: index == animationPage ? Colors.purple : Colors.white,
                ),
              ),
            );
          }),
    );
  }
}
