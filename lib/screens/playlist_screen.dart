import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("asset/lf30_editor_bragky0o.json",
                animate: true, repeat: true),
          ],
        ),
      ),
    );
  }
}
