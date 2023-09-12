import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants.dart';

class FeaturedRecipes extends StatelessWidget {
  const FeaturedRecipes(
      {super.key, required this.imageUrl, required this.text});
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key, required this.imageUrl, required this.text});
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        Text(
          text,
          style: style2,
        ),
      ],
    );
  }
}

class PopularRecipes extends StatelessWidget {
  const PopularRecipes({super.key, required this.imageUrl, required this.text});
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
        ),
        Text(text),
      ],
    );
  }
}
