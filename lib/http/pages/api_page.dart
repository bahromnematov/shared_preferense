import 'package:flutter/material.dart';

import '../service/http_service.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  void _apiPostLIst() {
    HttpService.GET(HttpService.API_LIST, HttpService.paramsEmpty())
        .then((value) => {
              print(value.toString()),
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostLIst();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
