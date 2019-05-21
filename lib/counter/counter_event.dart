import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  CounterEvent([List props = const []]) : super(props);
}

class IncrementEvent extends CounterEvent {
  @override
  String toString() {
    return 'onIncrement';
  }
}

class DecrementEvent extends CounterEvent {
  @override
  String toString() {
    return 'onDecrement';
  }
}
