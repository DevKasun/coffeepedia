import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> coffeeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoffeePedia"),
        actions: [
          IconButton(
              onPressed: () {
                _fetchUsers();
              },
              icon: Icon(Icons.replay_outlined))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: coffeeList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      coffeeList[index]["title"],
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _fetchUsers() async {
    print("Fetch users called");

    const url = "https://api.sampleapis.com/coffee/hot";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      coffeeList = json;
    });
  }
}
