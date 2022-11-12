import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();

  Model m = Get.put(Model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Calculator using GetX",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: TextField(
              controller: first,
              keyboardType: TextInputType.number,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 3)),
                border: OutlineInputBorder(),
                hintText: "Enter First",
                labelText: "First",
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
            ),
          )),
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: TextField(
              controller: second,
              keyboardType: TextInputType.number,
              cursorColor: Colors.blueGrey,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 3)),
                border: OutlineInputBorder(),
                hintText: "Enter Second",
                labelText: "Second",
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
            ),
          )),
          Center(
            child: Container(
                margin: EdgeInsets.all(10),
                child: Obx(() => Text(
                      "Answer :  ${m.ans.value}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ))),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: () {

                String First = first.text;
                String Second = second.text;

                m.plus(First, Second);
              },
              child: Text(
                "+",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
        ],
      ),
    );
  }
}

class Model extends GetxController {

  RxInt ans = 0.obs;

  void plus(
    String First,
    String Second,
  ) {
    double a = 0;
    double b = 0;

    if (First.trim().isNotEmpty) {
      a = double.parse(First);
    }
    if (Second.trim().isNotEmpty) {
      b = double.parse(Second);
    }

    int c = (a + b) as int;
    ans = c.obs;
    print(ans);
  }
}











