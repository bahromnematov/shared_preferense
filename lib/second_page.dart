import 'package:flutter/material.dart';
import 'package:shared_preferense/service/secure_storage_service.dart';
import 'package:shared_preferense/service/shared_preference.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String a = "";

  void loadAppName() {
    SecureService.loadApiKey().then((value) => {
          setState(() {
            a = value!;
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAppName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          a,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
