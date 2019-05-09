import 'package:bloc/bloc.dart';

import 'counter.dart';


class CounterState {
  final int counter;

  const CounterState({this.counter});

  factory CounterState.initial() => CounterState(counter: 0);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: currentState.counter - 1);
    }
  }
}
