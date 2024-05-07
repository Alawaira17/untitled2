// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import

import 'package:flutter/material.dart';
import 'Services/ApiService.dart';
import 'UserController.dart';
import 'Model/UserModel.dart';


class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserController _controller = UserController();
  List<UserModel> _users = []; // Store fetched users here

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Fetch users from the controller
      _users = await _controller.fetchUsers();
      setState(() {
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load users: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Get Data from json inside listview",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _users.isEmpty
          ? Text("لا يوجد بيانات")
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          UserModel myItem = _users[index]; // Get user at the current index
          return Row(
            children: [
              Text(" Id : " + myItem.userId.toString()),
              Text(" - Name : " + myItem.userFullName.toString()),
            ],
          );
        },
      ),
    );
  }
}
