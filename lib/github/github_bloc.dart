import 'package:bloc/bloc.dart';

import 'github_event.dart';
import 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {

  /*void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }*/

  @override
  GithubState get initialState =>GithubInitial();

  @override
  Stream<GithubState> mapEventToState(GithubEvent event) async*{

  }

  /*@override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: currentState.counter - 1);
    }
  }*/
}