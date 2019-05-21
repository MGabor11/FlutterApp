import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/auth/auth.dart';
import 'package:my_app/counter/counter.dart';
import 'package:my_app/github/github_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                RaisedButton(
                  child: Text('logout'),
                  onPressed: () {
                    authenticationBloc.dispatch(LoggedOut());
                  },
                ),
                RaisedButton(
                    child: Text('To count'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CounterPage(
                                    title: 'denis',
                                  )));
                    }),
                RaisedButton(
                    child: Text('To GitHub search'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GithubPage( title: 'ROADJACK')));
                    })
              ])),
        ));
  }
}
