import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/web_page.dart';

class SearchPage extends StatefulWidget {
  final String search;
  const SearchPage({
    super.key,
    required this.search,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Model> models = [];

  getApiData(search) async {
    final url =
        "https://api.edamam.com/search?q=$search&app_id=d12084ee&app_key=9b425f5bb00191f523150c6b80eb1752	&from=0&to=100&calories=591-722&health=alcohol-free";
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Model model = Model(
          url: e["recipe"]["url"],
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
    getApiData(widget.search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mobileBackgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Search results for ${widget.search}",
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.restaurant_menu)
            ],
          ),
        ),
        body: models.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                    itemCount: models.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>WebPage(url: models[index].url,) )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(models[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(models[index].labelled,
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ));
  }
}
