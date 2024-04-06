// import 'dart:convert';
import 'dart:convert';

import 'package:api_connection/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  List<Users> _userData = [];

  List<Users> get userData => _userData;

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _userData = List<Users>.from(jsonData.map((e) => Users.fromJson(e)));
      notifyListeners();
    } else {
      throw Exception('Failed to load user data');
    }
  }
}