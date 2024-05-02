import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:shared_preferense/news_app/popular_page.dart';
import 'package:shared_preferense/news_app/recent_page.dart';
import 'package:shared_preferense/news_app/trending_page.dart';

import '../model/crypto_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo_sharp)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Trending",
              ),
              Tab(
                text: "Recent",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularPage(),
            TrendingPage(),
            RecentPage(),
          ],
        ),
        drawer: Drawer(),
      ),
    );
  }
}
