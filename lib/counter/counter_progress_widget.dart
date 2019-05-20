import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/counter/counter.dart';

class CounterProgressWidget extends StatefulWidget {
  @override
  _CounterProgressWidgetState createState() => _CounterProgressWidgetState();
}

class _CounterProgressWidgetState extends State<CounterProgressWidget>
    with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  int currentCounterNumber = 0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
    percentage = 0.0;
    percentageAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {
              percentage = lerpDouble(percentage, newPercentage,
                  percentageAnimationController.value);
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (context, CounterState state) {
          if (state.counter != currentCounterNumber) {
            _onWidgetDidBuild(() {
              percentage = newPercentage;
              if(currentCounterNumber<state.counter) {
                newPercentage += 10;
              }else{
                newPercentage -= 10;
              }
              if (newPercentage > 100.0 || newPercentage < -100.0 ) {
                percentage = 0.0;
                newPercentage = 0.0;
              }
              currentCounterNumber = state.counter;
              percentageAnimationController.forward(from: 0.0);
            });
          }

          return Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: CustomPaint(
                foregroundPainter: _MyPainter(
                    lineColor: Colors.amber,
                    completeColor: Colors.blueAccent,
                    completePercent: percentage,
                    width: 8.0),
              ),
            ),
          );
        });
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

class _MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  _MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
