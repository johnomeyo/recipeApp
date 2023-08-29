import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Model> models = [];
  final url =
      "https://api.edamam.com/search?q=chicken&app_id=d12084ee&app_key=9b425f5bb00191f523150c6b80eb1752	&from=0&to=100&calories=591-722&health=alcohol-free";
  getApiData() async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Model model = Model(
          url: e["recipe"]["uri"],
          image: e['recipe']['image'],
          source: e['recipe']['source'],
          labelled: e['recipe']['label']);
      setState(() {
        models.add(model);
      });
    });
    print(models);
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
            itemCount: models.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(models[index].image))),
                )));
  }
}
