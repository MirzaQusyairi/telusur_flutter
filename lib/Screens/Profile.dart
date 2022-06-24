import 'package:flutter/material.dart';
import 'package:lets_head_out/utils/TextStyles.dart';
import 'package:lets_head_out/utils/consts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Profil", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kgreyDark,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Muhammad Khiyarus", 20.0, kblack),
                      Row(
                        children: <Widget>[
                          NormalText("Bandung", kgreyDark, 16),
                          Icon(
                            Icons.location_on,
                            color: kgreyDark,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 2,
              color: kgreyFill,
            ),
            ProfileItem(Icons.person, "Tentang Saya"),
            ProfileItem(Icons.settings, "Pengaturan"),
            ProfileItem(Icons.help, "Bantuan"),
            ProfileItem(Icons.exit_to_app, "Sign Out"),
          ],
        ),
      ),
    );
  }

  Widget ProfileItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 9),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: kdarkBlue,
            size: 40,
          ),
          SizedBox(
            width: 8,
          ),
          NormalText(text, kblack, 20.0)
        ],
      ),
    );
  }
}
