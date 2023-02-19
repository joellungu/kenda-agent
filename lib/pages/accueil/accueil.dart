import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenda_agent/pages/course/course.dart';
import 'package:kenda_agent/pages/profil/profil.dart';

import '../regularisation/regularisation.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Accueil();
  }
}

class _Accueil extends State<Accueil> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: page == 0
          ? Course()
          : page == 1
              ? Regularisation()
              : Profil(),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          //
          setState(() {
            page = e;
          });
        },
        currentIndex: page,
        selectedItemColor: Colors.indigo.shade900,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bus),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.qrcode_viewfinder),
            label: "Scanne",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
