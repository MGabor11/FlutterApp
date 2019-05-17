import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.dart';

class CounterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
          bloc: BlocProvider.of<CounterBloc>(context),
          builder: (context, CounterState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            );
          });
  }
}
