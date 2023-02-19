import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/course/course.dart';
import 'package:kenda_agent/pages/profil/profil.dart';
import 'package:kenda_agent/widgets/course_item.dart';

import 'historique.dart';
import 'vendeur_controller.dart';

class Vendeur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Vendeur();
  }
}

class _Vendeur extends State<Vendeur> {
  //
  VendeurController vendeurController = Get.find();
  //
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //appBar: AppBar(),
          body: page == 0
              ? ListView(children: [
                  Container(
                    height: 30,
                    color: Colors.indigo.shade100,
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          color: Colors.indigoAccent.shade400,
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Feuilles de route des courses"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FutureBuilder(
                      future: vendeurController.getAllCoures(),
                      builder: (c, t) {
                        if (t.hasData) {
                          List l = t.data as List;
                          return Column(
                            children: List.generate(
                              l.length,
                              (index) {
                                Map e = l[index];
                                return CourseItem(e);
                              },
                            ),
                          );
                        } else if (t.hasError) {
                          return Container();
                        }

                        return Center();
                      },
                    ),
                  )
                ])
              : page == 1
                  ? Historique()
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bus),
                label: "Courses",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timelapse),
                label: "Historiques",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
