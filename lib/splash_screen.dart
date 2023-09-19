import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(child: Image.asset("assets/prep.png")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Cookit",
              style: GoogleFonts.greatVibes(
                  fontWeight: FontWeight.w900, fontSize: 55, letterSpacing: 4),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Created by ",
                  style: GoogleFonts.sacramento(fontSize: 20),
                ),
                Text(
                  "John",
                  style: GoogleFonts.aBeeZee(letterSpacing: 2),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
