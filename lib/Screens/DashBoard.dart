import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telusur_flutter/utils/BestRatedImage.dart';
import 'package:telusur_flutter/utils/Buttons.dart';
import 'package:telusur_flutter/utils/CitiesImage.dart';
import 'package:telusur_flutter/utils/RecommendationImage.dart';
import 'package:telusur_flutter/utils/TextStyles.dart';
import 'package:telusur_flutter/utils/consts.dart';
import 'package:telusur_flutter/utils/imageContainer.dart';
import 'package:telusur_flutter/model/post.dart';
import 'package:http/http.dart' as http;

import 'OverViewScreen.dart';

Future<List<Post>> fetchPost() async {
  var response = await http.get(Uri.parse('http://127.0.0.1:8000/api/post'));
  return (json.decode(response.body)['data'] as List)
      .map((e) => Post.fromJson(e))
      .toList();
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                      child: BoldText("Blog", 20.0, kblack)),
                ),
                Container(
                  width: 330,
                  height: 150,
                  child: FutureBuilder(
                      future: fetchPost(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Post> post = snapshot.data as List<Post>;
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: post.length,
                            itemBuilder: (BuildContext context, int index) =>
                                InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/detail_page",
                                    arguments: post[index]);
                              },
                              child: buildContainer(post[index].image,
                                  post[index].title, post[index].author),
                            ),
                            separatorBuilder: (content, _) => const SizedBox(
                              width: 20,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
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

  Widget buildContainer(String image, String title, String author) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (_) {
      //     return OverViewPage();
      //   }));
      // },
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
                      "assets/images/balongan.jpg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 11.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // BoldText("5 Stars", 10.0, korangelite),
                        Icon(
                          Icons.account_circle_sharp,
                          color: kgreyDark,
                          size: 15.0,
                        ),
                        NormalText(author, kgreyDark, 10.0)
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
