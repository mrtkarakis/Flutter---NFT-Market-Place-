import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final LinearGradient? linearGradient;
  final Alignment textAlignment;
  final int milliseconds;
  final double height;
  final double width;
  final bool shadow;
  final Offset shadowOffset;
  final Color shadowColor;
  final double shadowRadius;
  final Function? onPressed;

  AnimatedButton({
    Key? key,
    required this.text,
    this.bgColor = Colors.white,
    this.textColor = const Color(0xff1916a5),
    this.milliseconds = 444,
    this.height = 55,
    this.width = 130,
    this.linearGradient,
    this.shadow = true,
    this.shadowColor = Colors.grey,
    this.shadowRadius = 12,
    this.shadowOffset = const Offset(-2, 7),
    this.textAlignment = const Alignment(0, 0.2),
    this.onPressed,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool animated = false;
  bool isTimer = false;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: widget.milliseconds),
          onEnd: () {
            timer = Timer(
                Duration(milliseconds: (widget.milliseconds * 1.5).toInt()),
                () {
              setState(() => animated = false);
              isTimer = false;
            });
          },
          height: widget.height,
          width: animated ? widget.width : widget.height,
          decoration: BoxDecoration(
              boxShadow: widget.shadow
                  ? [
                      BoxShadow(
                          offset: widget.shadowOffset,
                          blurRadius: widget.shadowRadius,
                          color: widget.shadowColor,
                          spreadRadius: -1)
                    ]
                  : null,
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(widget.height / 2),
              gradient: widget.linearGradient),
        ),
        ElevatedButton(
          onPressed: () {
            if (!isTimer) {
              isTimer = true;
              timer?.cancel();
            }
            setState(() {
              animated = true;
            });

            if (widget.onPressed != null) {
              Future.delayed(Duration(milliseconds: widget.milliseconds + 250),
                  () {
                widget.onPressed!();
              });
            }
          },
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            alignment: widget.textAlignment,
            elevation: 0,
            splashFactory: NoSplash.splashFactory,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const StadiumBorder(),
            minimumSize: Size(widget.width, widget.height),
          ),
        ),
      ],
    );
  }
}
