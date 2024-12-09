import 'dart:convert';

import 'package:api_practice/model/Photos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

List<Photos> photoList = [];

Future<List<Photos>> getPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map d in data) {
      photoList.add(Photos.fromJson(d));
    }
    return photoList;
  } else {
    return photoList;
  }
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {

                return ListView.builder(
                    itemCount: photoList.length,
                    itemBuilder: (context, index) => Card(
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image.network(photoList[index].thumbnailUrl.toString()),
                          ),
                          Text(photoList[index].title.toString())
                        ],
                      )
                    ),
                  );

              },
            ),
          )
        ],
      ),
    );
  }
}
