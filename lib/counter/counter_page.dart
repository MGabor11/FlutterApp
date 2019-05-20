import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/widget/widget.dart';

import 'counter.dart';
import 'counter_progress_widget.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc _counterBloc;

  @override
  void initState() {
    _counterBloc = CounterBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Center(
              child: Column(
        children: <Widget>[
          SimpleCheckBoxWidget(),
          BlocProvider(bloc: _counterBloc, child: CounterProgressWidget()),
          SizedBox(height: 50),
          BlocProvider(bloc: _counterBloc, child: CounterWidget())
        ],
      ))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _counterBloc.onIncrement(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => _counterBloc.onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
