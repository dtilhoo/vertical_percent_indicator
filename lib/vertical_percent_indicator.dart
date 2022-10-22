library vertical_percent_indicator;

import 'package:flutter/material.dart';

class VerticalBarIndicator extends StatefulWidget {
  const VerticalBarIndicator({
    Key? key,
    this.height,
    this.width,
    required this.percent,
    this.header,
    this.footer,
    this.color,
    this.circularRadius,
    this.headerStyle,
    this.footerStyle,
    this.animationDuration,
  }) : super(key: key);

  ///Height of the indicator. Default is 120.
  final double? height;

  ///Width of the indicator. Default is 20.
  final double? width;

  ///Percentage to be displayed. Should be between 0.0 and 1.0.
  final double percent;

  ///Optional header text
  final String? header;

  ///Header text style
  final TextStyle? headerStyle;

  ///Optional footer text
  final String? footer;

  ///Header text style
  final TextStyle? footerStyle;

  ///Color of the indicator. Default is green.
  final List<Color>? color;

  ///Border radius of the indicator. Default is 20.
  final double? circularRadius;

  ///Animation duration. Default is 2 seconds.
  final Duration? animationDuration;

  @override
  State<VerticalBarIndicator> createState() => _VerticalBarIndicatorState();
}

class _VerticalBarIndicatorState extends State<VerticalBarIndicator> {
  double _height = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(
        const Duration(seconds: 0),
      ).then(
        (value) => setState(
          () {
            _height = widget.height != null
                ? widget.percent * widget.height!
                : widget.percent * 120;
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        widget.header != null
            ? Text(
                widget.header!,
                style: widget.headerStyle,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5),
        SizedBox(
          height: widget.height ?? 120,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: widget.height ?? 120,
                  width: widget.width ?? 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        widget.circularRadius ?? 20,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: widget.animationDuration ??
                      const Duration(
                        seconds: 2,
                      ),
                  width: widget.width ?? 20,
                  height: _height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: widget.color ??
                          [
                            Colors.green,
                            Colors.green,
                          ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        widget.circularRadius ?? 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        widget.footer != null
            ? Text(
                widget.footer!,
                style: widget.footerStyle,
                textAlign: TextAlign.center,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 5)
      ],
    );
  }
}
