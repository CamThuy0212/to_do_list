import 'dart:developer';

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
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    log("rebuild");
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
            children: items
                .map((item) => CardBody(
                      index: items.indexOf(item),
                      item: item,
                      handleDelete: _handleDeleteTask,
                    ))
                .toList(),
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
                  return ModalBottom(addTask: _handleAddTask);
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
