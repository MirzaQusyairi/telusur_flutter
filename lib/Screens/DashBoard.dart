import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lets_head_out/utils/BestRatedImage.dart';
import 'package:lets_head_out/utils/Buttons.dart';
import 'package:lets_head_out/utils/CitiesImage.dart';
import 'package:lets_head_out/utils/RecommendationImage.dart';
import 'package:lets_head_out/utils/TextStyles.dart';
import 'package:lets_head_out/utils/consts.dart';
import 'package:lets_head_out/utils/imageContainer.dart';

import 'OverViewScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageContainer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Destinasi", 20.0, kblack)),
                ),
                Container(
                  width: 330,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildContainer(),
                      SizedBox(
                        width: 20,
                      ),
                      buildContainer(),
                      SizedBox(
                        width: 20,
                      ),
                      buildContainer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Destinasi Terbaik", 16.0, kblack),
                      SizedBox(
                        width: 60,
                      ),
                      BoldText("Selengkapnya", 12.0, korange),
                      Icon(
                        Icons.navigate_next,
                        color: korange,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      RecommendationImage("assets/images/karangsong.jpg",
                          "Hutan Mangrove Karangsong", "Desa Karangsong"),
                      RecommendationImage("assets/images/rambat.jpg",
                          "Pantai Rambat", "Jl. Raya Juntikedokan"),
                      RecommendationImage("assets/images/tirtamaya.jpeg",
                          "Pantai Tirtamaya", "Desa Juntikedokan"),
                      RecommendationImage("assets/images/biawak.jpg",
                          "Pulau Biawak", "Kep. Biawak"),
                      RecommendationImage("assets/images/waterboom.jpg",
                          "Waterboom Bojongsari", "Desa Bojongsari"),
                      RecommendationImage("assets/images/balongan.jpg",
                          "Pantai Balongan Indah", "Desa Balongan"),
                      RecommendationImage("assets/images/rusa.jpg",
                          "Taman Rusa Bumi Patra", "Jl. Raya Bumi Patra"),
                      RecommendationImage("assets/images/tugu.jpg",
                          "Tugu Perjuangan", "Desa Pekandangan"),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, bottom: 16.0),
                //   child: Align(
                //       alignment: Alignment.centerLeft,
                //       child: BoldText("Best Rated Places", 20.0, kblack)),
                // ),
                // Container(
                //   width: 400,
                //   height: 250,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       // BestRatedImage(
                //     "assets/sheraton.jpg", "Sheraton", "Oran", 4.5),
                // BestRatedImage(
                //     "assets/Meridien.jpg", "Meridien", "Oran", 4.8),
                // BestRatedImage("assets/ibis.jpg", "Ibis", "Oran", 3.1),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Wonderful Indonesia", 20.0, kblack)),
                ),
                Row(
                  children: <Widget>[
                    CitiesImage("assets/images/rambat.jpg", "Pantai"),
                    SizedBox(
                      width: 28,
                    ),
                    CitiesImage("assets/images/tugu.jpg", "Sejarah"),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: <Widget>[
                    CitiesImage("assets/images/waterboom.jpg", "Wisata"),
                    SizedBox(
                      width: 28,
                    ),
                    CitiesImage("assets/images/karangsong.jpg", "Alam"),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return OverViewPage();
        }));
      },
      child: Container(
        width: 320,
        height: 50,
        child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset(
                        "assets/images/kelingking.jpg",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BoldText("Pantai Kelingking", 11.5, kblack),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // BoldText("5 Stars", 10.0, korangelite),
                        Icon(
                          Icons.location_on,
                          color: kgreyDark,
                          size: 15.0,
                        ),
                        NormalText("Nusa Penida", kgreyDark, 10.0)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: korange,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Icon(
                              //   Icons.star,
                              //   color: kwhite,
                              //   size: 15.0,
                              // ),
                              // BoldText("4.5", 10.0, kwhite)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // NormalText("(1024 Reviews)", kgreyDark, 10.0),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // BoldText("Book& Save 30% !", 10.0, Colors.red),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 90,
                        ),
                        BoldText("More", 12.0, kblack),
                        Icon(
                          Icons.navigate_next,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Row imagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SquaredIcon(Icons.airplanemode_active, "Flights"),
        SquaredIcon(FontAwesomeIcons.hotel, "Hotels"),
        SquaredIcon(Icons.directions_car, "Cars"),
      ],
    );
  }
}
