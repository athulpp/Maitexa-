import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:itunes/model/itunes_model.dart';

import 'package:itunes/widgets/app_text.dart';

class DetailScreen extends StatelessWidget {
  Results data;
  DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.artistName!),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: NetworkImage(data.artworkUrl100!),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                  color: HexColor('#333333')),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ReusbleRow(
                    data: data,
                    title: "Collection Price",
                    desc: "\$${data.collectionPrice}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusbleRow(
                    data: data,
                    title: "Primary Genre Name",
                    desc: "${data.primaryGenreName}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusbleRow(
                    data: data,
                    title: "Country",
                    desc: "${data.country}",
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ExpansionTile("Descripition", "${data.description}", false),
          ]),
        ),
      ),
    );
  }

  ExpansionTileCard ExpansionTile(title, subTitle, isExpand) {
    return ExpansionTileCard(
      elevation: 1,
      animateTrailing: true,
      initiallyExpanded: isExpand,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      baseColor: HexColor('#333333'),
      expandedTextColor: Colors.white,
      expandedColor: HexColor('#061a00'),
      shadowColor: Colors.lightGreenAccent,
      trailing: const Icon(Icons.arrow_drop_down, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.acme(fontSize: 20, color: Colors.white),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Divider(
            color: Colors.grey[800],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 18.0,
            ),
            child: Text(
              subTitle,
              style: GoogleFonts.acme(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class ReusbleRow extends StatelessWidget {
  var title;
  var desc;
  ReusbleRow(
      {Key? key, required this.title, required this.desc, required this.data})
      : super(key: key);

  final Results data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: title,
            weight: FontWeight.w600,
            color: Colors.white,
          ),
          SizedBox(
            child: AppText(
              text: desc,
              weight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
