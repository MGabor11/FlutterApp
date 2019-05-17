import 'package:flutter/material.dart';

class SimpleCheckBoxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleCheckBoxWidgetState();
  }
}

class _SimpleCheckBoxWidgetState extends State<SimpleCheckBoxWidget> {
  var _counter = 0;
  var _isChecked = false;

  void _valueChanged(bool value) => setState(() {
        _isChecked = value;
        _counter++;
        print("Counter value {$_counter}");
      });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Text("Counter value {$_counter}"),
          Checkbox(value: _isChecked, onChanged: _valueChanged)
        ],
      );
}
