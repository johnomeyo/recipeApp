import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/components/alpha.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/search_result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // searchController.clear();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recipe Choice",
                    style: style1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade500,
                                ),
                                hintText: "Search for recipes",
                                hintStyle: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade500))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (searchController.text.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage(
                                        search: searchController.text)));
                          } else if (searchController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.black,
                                content: Text(
                                  "The search can't be empty",
                                  style: GoogleFonts.aBeeZee(
                                      textStyle:
                                          const TextStyle(color: Colors.white)),
                                )));
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Featured Recipes",
                    style: style2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FeaturedRecipes(
                            imageUrl:
                                "https://images.unsplash.com/photo-1612366747681-e4ca6992b1e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1608&q=80",
                            text: "Bread"),
                        SizedBox(
                          width: 10,
                        ),
                        FeaturedRecipes(
                            imageUrl:
                                "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                            text: "Pizza"),
                        SizedBox(
                          width: 10,
                        ),
                        FeaturedRecipes(
                            imageUrl:
                                "https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                            text: "Chicken")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Categories",
                    style: style2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1559847844-d9d2bc807d82?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                            text: "Main course"),
                        SizedBox(
                          width: 10,
                        ),
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1590779033100-9f60a05a013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                            text: "Vegetables"),
                        SizedBox(
                          width: 10,
                        ),
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1827&q=80",
                            text: "Dessert"),
                        SizedBox(
                          width: 10,
                        ),
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1548340748-6d2b7d7da280?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1664&q=80",
                            text: "Appetizers"),
                        SizedBox(
                          width: 10,
                        ),
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                            text: "Beverages"),
                        SizedBox(
                          width: 10,
                        ),
                        Categories(
                            imageUrl:
                                "https://images.unsplash.com/photo-1534938665420-4193effeacc4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1742&q=80",
                            text: "Side dishes")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Popular Recipes",
                    style: style1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PopularRecipes(
                          imageUrl:
                              'https://images.unsplash.com/photo-1564834744159-ff0ea41ba4b9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
                          text: 'Masala Egg Rice',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        PopularRecipes(
                            imageUrl:
                                "https://images.unsplash.com/photo-1587033649773-5c231faa21e3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1664&q=80",
                            text: "North Indian Tiffin"),
                        SizedBox(
                          width: 10,
                        ),
                        PopularRecipes(
                            imageUrl:
                                "https://images.unsplash.com/photo-1520700008388-af1981de9835?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                            text: "Berry Pancake")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
