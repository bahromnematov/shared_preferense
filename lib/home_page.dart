import 'package:flutter/material.dart';
import 'package:shared_preferense/model/user_model.dart';
import 'package:shared_preferense/service/shared_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user1 = User(102, "email@gmail.com", "password");
    PrefsService.storeUser(user1);
    PrefsService.loadUser().then((value) => {
          print(value),
        });
    PrefsService.removeUser();

    PrefsService.storeName2("Salom");
    PrefsService.storeName("Hello");
    PrefsService.loadName().then((value) => {
          print(value),
        });

    PrefsService.removeName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
