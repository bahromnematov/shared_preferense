import 'package:flutter/material.dart';
import 'package:shared_preferense/http/model/emp_model.dart';
import '../service/http_service.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<Employee> items = [];
  bool isLoading = false;

  void _apiPostLIst() async {
    setState(() {
      isLoading = true;
    });
    var response =
        await HttpService.GET(HttpService.API_LIST, HttpService.paramsEmpty());

    if (response != null) {
      setState(() {
        isLoading = false;
        items = HttpService.parseApiList(response);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostLIst();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return itemPost(items[index]);
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget itemPost(Employee post) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.name),
          Text(post.symbol),
        ],
      ),
    );
  }
}
