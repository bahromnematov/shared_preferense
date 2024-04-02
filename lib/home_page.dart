import 'package:flutter/material.dart';
import 'package:shared_preferense/model/user_model.dart';
import 'package:shared_preferense/second_page.dart';
import 'package:shared_preferense/service/shared_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();

  name() {
    String name = nameController.text.toString().trim();
    PrefsService.storeName(name);
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SecondPage();
    }));
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   nameController = TextEditingController();
  //   var user1 = User(102, "email@gmail.com", "password");
  //   PrefsService.storeUser(user1);
  //   PrefsService.loadUser().then((value) => {
  //         print(value),
  //       });
  //   PrefsService.removeUser();
  //
  //   PrefsService.storeName2("Salom");
  //   PrefsService.storeName("Hello");
  //   PrefsService.loadName().then((value) => {
  //         print(value),
  //       });
  //
  //   PrefsService.removeName();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Ismingizni Kiriting",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 56,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: nameController,
              decoration:
                  InputDecoration(hintText: "Name", border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                name();
              },
              child: Text("Start"))
        ],
      ),
    );
  }
}
