import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/model.dart';
import 'package:recipe_app/search_result_page.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Model> models = [];
  final searchController = TextEditingController();
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
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mobileBackgroundColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                                TextButton(
                                    onPressed: () {
                                      if (searchController.text.isNotEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchPage(
                                                        search: searchController
                                                            .text)));

                                        searchController.clear();
                                      }
                                    },
                                    child: const Text("Search"))
                              ],
                              content: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: searchController,
                                      decoration: InputDecoration(
                                          hintText: "Search for a recipe",
                                          hintStyle: GoogleFonts.lato()),
                                    )
                                  ],
                                ),
                              ),
                            ));
                  },
                  icon: const Icon(Icons.search)),
            )
          ],
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Food menu"), Icon(Icons.restaurant_menu)],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              itemCount: models.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    // image: DecorationImage(
                    //     image: NetworkImage(models[index].image))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300,
                                image: DecorationImage(
                                    image: NetworkImage(models[index].image),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Text(models[index].labelled,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
        ));
  }
}
