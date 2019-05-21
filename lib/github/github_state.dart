import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GithubState extends Equatable {
  GithubState([List props = const []]) : super(props);
}

class GithubInitial extends GithubState {
  @override
  String toString() => 'LoginInitial';
}

class GithubLoading extends GithubState {
  @override
  String toString() => 'LoginLoading';
}

class GithubResult extends GithubState {
  @override
  String toString() => 'GithubResult';
}

class GithubFailure extends GithubState {
  final String error;

  GithubFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'GithubFailure { error: $error }';
}