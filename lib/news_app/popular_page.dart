import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferense/news_app/model/news_model.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
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
          FlutterCarousel(
            options: CarouselOptions(
              autoPlay: true,
              height: 330.0,
              showIndicator: true,
              slideIndicator: CircularSlideIndicator(
                  padding: EdgeInsets.all(20),
                  indicatorBackgroundColor: Colors.black,
                  indicatorRadius: 6),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/cars.png"),
                            fit: BoxFit.cover)),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
              child: FutureBuilder(
            future: getAllNews(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(posts[index].urlToImage!),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  posts[index].title.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(posts[index].content.toString()),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
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
