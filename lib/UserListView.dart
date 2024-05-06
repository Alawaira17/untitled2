// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'UserController.dart';
import 'UserModel.dart';


class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  List users = [];
  final UserController _controller = UserController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      users = await _controller.fetchUsers();
      setState(() {});
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
      body: users.isEmpty
          ? Text("لا يوجد بيانات")
          : ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            UserModel myItem = UserModel.fromJson(users[index]);
            return Row(
              children: [
                Text(" Id : " + myItem.userId.toString()),
                Text(" - Name : " + myItem.userFullName.toString()),
              ],
            );
          }),
    );
  }
}