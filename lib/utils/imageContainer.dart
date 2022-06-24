import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';
import 'forms.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 500.0,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/mandalika.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BoldText("Telusur", 30.0, kwhite),
                  BoldText("Wisata apa yang anda cari ?", 20.0, kwhite)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NormalForm(Icons.search, "Temukan wisata anda disini"),
            ),
          )
        ],
      ),
    );
  }
}
