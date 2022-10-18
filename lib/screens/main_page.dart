import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:itunes/screens/home_screen.dart';
import 'package:itunes/screens/playlist_screen.dart';
import 'package:itunes/screens/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List pages = [HomeScreen(), SearchScreen(), PlayListScreen()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
        ),
        child: BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('#050b18'),
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: HexColor('#6149d9'),
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 6,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? Colors.white
                        : Colors.grey.withOpacity(0.5),
                  )),
              BottomNavigationBarItem(
                label: 'Bar',
                icon: Icon(
                  Icons.search,
                  color: currentIndex == 1
                      ? Colors.white
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(
                    Icons.playlist_play_rounded,
                    color: currentIndex == 2
                        ? Colors.white
                        : Colors.grey.withOpacity(0.5),
                  )),
            ]),
      ),
    );
  }
}
