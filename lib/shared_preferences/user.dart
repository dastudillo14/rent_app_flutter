import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rent_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
  }

  set user(User? user) {
    _prefs?.setString('USER', json.encode(user));
  }

  User? get user {
    String? userString = _prefs?.getString("USER");
    if (userString != null) {
      return User.fromJson(json.decode(userString));
    }
    return null;
  }

  set login(bool flag){
    _prefs?.setBool('LOGIN', flag);
  }
  
  bool get login{
    return _prefs?.getBool('LOGIN')??false;
  }
}
