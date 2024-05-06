// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'UserModel.dart';



class ApiService {
  Future<List<UserModel>> getUsers() async {
    var url = Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/2/USER_TB');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<UserModel> users = [];
        for (var item in jsonData['items']) {
          users.add(UserModel.fromJson(item));
        }
        return users;
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}