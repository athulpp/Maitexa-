import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itunes/screens/home_screen.dart';
import 'package:itunes/screens/main_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
          (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("asset/52679-music-loader.json",
                animate: true, repeat: true),
            Text(
              "Itunes",
              style: GoogleFonts.actor(fontSize: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
