import 'package:flutter/material.dart';

import 'modal/items.dart';
import 'widget/cart_body_widget.dart';
import 'widget/cart_modal_bottom.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<DataItems> items = [
    DataItems(id: "1", name: "Tập thể dục"),
    DataItems(id: "2", name: "Tập thể dục 2"),
    DataItems(id: "3", name: "Tập thể dục 3"),
    DataItems(id: "4", name: "Tập thể dục 4"),
    // DataItems(id: "5", name: "Tập thể dục 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ToDoList",
            style: TextStyle(
              fontSize: 35,
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items.map((item) => CardBody(item: item)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                // shape: const RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return ModalBottom();
                });
          },
          // backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 40,
            // color: Colors.white,
          ),
        ));
  }
}
