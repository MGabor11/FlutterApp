import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:my_app/repository/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  static const _pref_token = 'token';
  static const _login_url = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final response = await http.get(_login_url);

    if (response.statusCode == 200) {
      var post = Post.fromJson(json.decode(response.body));
      print(post.toString());
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
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
