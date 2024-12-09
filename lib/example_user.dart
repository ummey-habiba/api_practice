import 'dart:convert';

import 'package:api_practice/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserExample extends StatefulWidget {
  const UserExample({super.key});

  @override
  State<UserExample> createState() => _UserExampleState();
}

List<UserModel> userList = [];

Future<List<UserModel>> getUser() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var user = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map u in user) {
      userList.add(UserModel.fromJson(u));
    }
    return userList;
  } else {
    return userList;
  }
}

class _UserExampleState extends State<UserExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Example'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(userList[index].id.toString()),
                      ),
                      title: Text(userList[index].name.toString()),
                      subtitle: Text(userList[index].address!.city.toString()),
                      trailing: Text(userList[index].phone.toString()),

                    ),
                  ),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
