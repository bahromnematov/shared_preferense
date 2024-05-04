import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferense/news_app/service/utils.dart';
import 'model/news_model.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<Articles> posts = [];

  Future<void> getAllNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-04&sortBy=publishedAt&apiKey=2eebeaa50122431cb3c2a603d3920bae"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> articlesData = data['articles'];

      setState(() {
        posts = articlesData.map((e) => Articles.fromJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getAllNews(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Utils.launchInBrauther(Uri.parse(posts[index].url!));
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 140,
                              width: 120,
                              child: posts[index].urlToImage == null
                                  ? Image.asset(
                                      "assets/cars.png",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      posts[index].urlToImage!,
                                      fit: BoxFit.cover,
                                    )),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  posts[index].title == null
                                      ? Text("Null")
                                      : Text(
                                          posts[index].title!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                  posts[index].content == null
                                      ? Text("Null")
                                      : Text(posts[index].content!),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  posts[index].publishedAt.toString() == null
                                      ? Text("Null")
                                      : Text(
                                          posts[index].publishedAt.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
