import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/repository/user_repository.dart';

void main() => runApp(App(userRepository: UserRepository(),));
