import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("asset/lf30_editor_zeyltshj.json",
                animate: true, repeat: true),
          ],
        ),
      ),
    );
  }
}
