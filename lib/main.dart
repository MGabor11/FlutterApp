import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth.dart';
import 'constants.dart';
import 'counter/counter_page.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'repository/user_repository.dart';
import 'splash/splash_page.dart';
import 'widget/loading_indicator.dart';

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  final routes = <String, WidgetBuilder>{
    counterPageTag: (context) => CounterPage(title: 'This is the counter')
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: appDarkGreyColor),
          home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is AuthenticationUninitialized) {
                return SplashPage();
              }
              if (state is AuthenticationAuthenticated) {
                return HomePage();
              }
              if (state is AuthenticationUnauthenticated) {
                return LoginPage(userRepository: _userRepository);
              }
              if (state is AuthenticationLoading) {
                return LoadingIndicator();
              }
            },
          )),
    );
  }
}

/*final routes = <String, WidgetBuilder>{
    loginPageTag: (context) => LoginPage(),
    homePageTag: (context) => HomePage(),
    counterPageTag: (context) => CounterPage(),
    splashPageTag: (context) => SplashPage()
  };*/

/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: appDarkGreyColor
        ),
        home: CounterPage(title: 'Flutter Demo Home Page'),
        routes: routes);*/
