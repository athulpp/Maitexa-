import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:itunes/model/itunes_model.dart';
import 'package:itunes/screens/detail_screen.dart';
import 'package:itunes/widgets/app_large_text.dart';
import 'package:itunes/widgets/app_text.dart';
import 'package:skeletons/skeletons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<ItunesModel?> getAllSongs() async {
      Dio dio = Dio();

      var response =
          await dio.get('https://itunes.apple.com/search?term=radiohead');
      if (response.statusCode == 200) {
        // print(response.data);
        var jsonData = json.decode(response.data);
        // print(jsonData);
        return ItunesModel.fromJson(jsonData);
      } else {
        log(response.statusCode.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'All Songs',
        ),
        actions: const [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          color: HexColor('#121212'),
          height: size.height,
          child: FutureBuilder<ItunesModel?>(
            future: getAllSongs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.resultCount,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(
                                data: snapshot.data!.results![index],
                              );
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot.data!
                                              .results![index].artworkUrl100!),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: AppLargeText(
                                        text: snapshot
                                            .data!.results![index].artistName!,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AppText(
                                        text:
                                            "\$ ${snapshot.data!.results![index].collectionPrice!}",
                                        weight: FontWeight.w600,
                                        color: Colors.white)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Text('No data');
                }
              } else {
                return SkeletonItem(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle,
                              width: 120,
                              height: 120),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle,
                              width: 120,
                              height: 120),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle,
                              width: 120,
                              height: 120),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle,
                              width: 120,
                              height: 120),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle,
                              width: 120,
                              height: 120),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 6,
                                      maxLength:
                                          MediaQuery.of(context).size.width / 3,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}
