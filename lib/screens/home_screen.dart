import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
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
        child: CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
          items: coffeeList.map(
            (coffee) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(color: Colors.brown[100]),
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image.network(
                            coffee['image'],
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            coffee['title'],
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(height: 20.0),
                          Text(coffee['description'],
                              style: TextStyle(fontSize: 14.0))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  _fetchUsers() async {
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
