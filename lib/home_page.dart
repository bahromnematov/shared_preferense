import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferense/model/albom_model.dart';
import 'package:shared_preferense/model/todo_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo> posts = [];
  List<Albom> posts_albom = [];

  Future<List<ToDo>> getAllToDo() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var a in data) {
        posts.add(ToDo.fromJson(a));
      }
      return posts;
    } else {
      return posts;
    }
  }

  Future<List<Albom>> getAllAlbom() async {
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var a in data) {
        posts_albom.add(Albom.fromJson(a));
      }
      return posts_albom;
    } else {
      return posts_albom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getAllToDo(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text("Loading");
                }else{
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts[index].id.toString()),
                              Text(posts[index].title),
                              Text(posts[index].userId.toString()),
                              Text(posts[index].completed.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },

            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getAllAlbom(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text("Loading");
                }else{
                  return ListView.builder(
                    itemCount: posts_albom.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts_albom[index].userId.toString()),
                              Text(posts_albom[index].title),
                              Text(posts_albom[index].id.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },

            ),
          )
        ],
      ),
    );
  }
}
