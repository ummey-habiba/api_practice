import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/PostsModels.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<PostsModels> postList =[];
Future<List<PostsModels>> getPostApi()async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data =jsonDecode(response.body.toString());
  if(response.statusCode== 200){
    postList.clear();
    for(Map i in data){
      postList.add(PostsModels.fromJson(i));

    }
    return postList;
  }else{
    return postList;
  }
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Practice'),),
      body: Column(
children: [
  Expanded(
    child: FutureBuilder(future: getPostApi(), builder: (context, snapshot) {
      if(!snapshot.hasData){
        return Text('Loading');
    
      }else{
        return ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
          return Card(
            child: Padding(padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(postList[index].title.toString()),
                SizedBox(height: 10,),
                Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(postList[index].body.toString()),
              ],
            ),),
          );
        },);
      }
    },),
  )
],
      ),
    );
  }
}
