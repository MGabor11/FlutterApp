import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

  static const _pref_token = "token";

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    (await getSharedPreferences()).remove(_pref_token);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    (await getSharedPreferences()).setString(_pref_token, token);
    await Future.delayed(Duration(seconds: 1));
    print('Saved token: '+ token);
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    final token = (await getSharedPreferences()).getString(_pref_token);
    if (token != null) {
      return true;
    }
    return false;
  }
}
