import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GithubEvent extends Equatable {
  GithubEvent([List props = const []]) : super(props);
}

class SearchStarted extends GithubEvent {
  final String text;

  SearchStarted({@required this.text}) : super([text]);

  @override
  String toString() => 'SearchStarted {$text}';
}
