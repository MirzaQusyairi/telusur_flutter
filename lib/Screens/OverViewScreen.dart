import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telusur_flutter/utils/Buttons.dart';
import 'package:telusur_flutter/utils/TextStyles.dart';
import 'package:telusur_flutter/utils/consts.dart';
import 'package:telusur_flutter/model/post.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:telusur_flutter/model/comment.dart';
import 'package:http/http.dart' as http;

class OverViewPage extends StatefulWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  _OverViewPageState createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  static final LatLng _kMapCenter = LatLng(-6.97299, 107.63030);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context)!.settings.arguments as Post;

    Future<List<Comment>> fetchComment() async {
      var response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/comment/post/1'));
      return (json.decode(response.body)['data'] as List)
          .map((e) => Comment.fromJson(e))
          .toList();
    }

    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/balongan.jpg")),
          ),
          Positioned(
            top: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 790,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "Selengkapnya"),
                      Tab(text: "Lokasi"),
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 500,
                                        child: Text(
                                          post.title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          // BoldText("4.5 Stars", 12.0, korange),
                                          // SizedBox(
                                          //   width: 16.0,
                                          // ),
                                          Icon(
                                            Icons.account_circle_sharp,
                                            color: kgreyDark,
                                            size: 15.0,
                                          ),
                                          NormalText(
                                              post.author, kgreyDark, 15.0),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // NormalText("Rp 5000/orang", kgreyDark, 16.0),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 2,
                                        color: kgreyFill,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          BoldText("Tentang", 20.0, kblack),
                                          BoldText("More", 16, kdarkBlue)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: <Widget>[
                                            Html(
                                              data: """
                                        ${post.body}
                                      """,
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Html(
                                      //   data: """
                                      //     ${post.body}
                                      //       """,
                                      // ),

                                      //NormalText(post.body, kblack, 12.0),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 2,
                                        color: kgreyFill,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          BoldText("equipments", 20.0, kblack),
                                          BoldText("More", 16, kdarkBlue),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          // equipmentsItem(Icons.wifi, "Wi-Fi"),
                                          equipmentsItem(
                                              Icons.local_parking, "Parking"),
                                          equipmentsItem(Icons.pool, "Pool"),
                                          equipmentsItem(
                                              Icons.restaurant, "Warung"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Location", 20.0, kblack),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    // child: Image.asset(
                                    //   "assets/images/map.jpg",
                                    //   fit: BoxFit.fill,
                                    //   height:
                                    //       MediaQuery.of(context).size.width -
                                    //           90,
                                    //   width: MediaQuery.of(context).size.width,
                                    // ),
                                    child: GoogleMap(
                                      initialCameraPosition: _kInitialPosition,
                                      markers: _createMarker(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        BoldText("Reviews", 20.0, kblack),
                                        //BoldText("Lihat Semua", 16, kdarkBlue),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 50.0,
                                          // decoration: BoxDecoration(
                                          //   color: korange,
                                          //   borderRadius:
                                          //       BorderRadius.circular(10.0),
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              // Icon(
                                              //   Icons.star,
                                              //   color: kwhite,
                                              //   size: 15.0,
                                              // ),
                                              // BoldText("4.5", 15.0, kwhite),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        // NormalText(
                                        //     "(420 reviews)", kgreyDark, 14),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 550,
                                      child: FutureBuilder(
                                        future: fetchComment(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            List<Comment> comment =
                                                snapshot.data as List<Comment>;
                                            return ListView.separated(
                                              itemCount: comment.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      InkWell(
                                                // onTap: () {
                                                //   Navigator.pushNamed(context, "/detail",
                                                //       arguments: comment[index]);
                                                // },
                                                child: reviewProfile(
                                                    comment[index].name,
                                                    comment[index].comment,
                                                    ""),
                                              ),
                                              separatorBuilder: (content, _) =>
                                                  const SizedBox(height: 12),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text("${snapshot.error}");
                                          }
                                          return const Center(
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        },
                                      ),
                                    )

                                    // reviewProfile("Anonim", "", ""),
                                    // reviewProfile(
                                    //     "Walid", "3.5", "17,feb,2020"),
                                    // reviewProfile(
                                    //     "kratos", "4.0", "10,jan,2020"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),

                  /*Stack(
                    children: <Widget>[
                      Image.asset("assets/hotel.jpg"),
                    ],

                  ),*/
                ),
              ),
            ),
          ),
          // Positioned(
          //     top: 700,
          //     left: 5,
          //     child: WideButton(
          //       // "BOOK NOW",
          //       // () {},
          //     )),
        ],
      ),
    );
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("Telkom University"),
        position: _kMapCenter,
        infoWindow: InfoWindow(title: 'Telkom University'),
      ),
    };
  }

  Widget reviewProfile(String name, String comment, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundColor: kgreyDark,
                child: Icon(
                  Icons.person,
                  size: 12,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BoldText(name, 16, kblack)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
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
                  // BoldText(review, 15.0, kwhite),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            NormalText(date, kgreyDark, 12.0)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        NormalText(comment, kblack, 12.0),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column equipmentsItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: kdarkBlue,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
