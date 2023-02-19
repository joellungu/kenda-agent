import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/course/course_controller.dart';
import 'package:kenda_agent/pages/course/infos.dart';
import 'package:kenda_agent/pages/course/reservation.dart';
import 'package:kenda_agent/widgets/modal.dart';

import 'details_arrets.dart';
import 'infos_supplementaire.dart';
import 'lieu.dart';
import 'plus.dart';

class Course extends GetView<CourseController> {
  Course() {
    controller.getAllCoures();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "Détails de la course",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: controller.obx(
            (state) {
              Map e = state!;
              //
              int arrs = 0;
              //
              List l = e['troncons'] ?? [];
              Set listTitre = Set();
              //
              l.forEach((element) {
                if (listTitre.add(element['arretArrive']['nom'])) {
                  arrs++;
                } else if (listTitre.add(element['arretDepart']['nom'])) {
                  arrs++;
                }
              });
              return ListView(
                children: [
                  Container(
                    height: Get.size.height / 7,
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
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Trajet éffectué en bus"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${e['provinceDepart']}, ${e['lieuDepart']}",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "${e['provinceArrive']}, ${e['lieuArrive']}"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.size.height / 7,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 22,
                            bottom: 5,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Départ : ${getDateDepart("${e['heureDepart']}")}",
                              //"Départ : dim. 4 déc",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${e['heureDepart']}"
                                      .split(" ")[1]
                                      .substring(0, 5),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                // color: Colors.green,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                //color: Colors.green,
                                child: Text(
                                  "${e['heureArrive']}"
                                      .split(" ")[1]
                                      .substring(0, 5),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (e['terminer']) {
                                      Get.snackbar("Erreur",
                                          "Cette course est déjà terminé.",
                                          colorText: Colors.white,
                                          backgroundColor:
                                              Colors.blue.shade900);
                                    } else {
                                      //Mettre fin à la course en question suivant son Id
                                      Get.dialog(
                                        Material(
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Container(
                                              height: 200,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Vous etes sur le point de terminer cette course",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      e['terminer']
                                          ? Colors.green.shade900
                                          : Colors.red.shade900,
                                    ),
                                  ),
                                  child: Text(
                                    e['terminer']
                                        ? "En coure"
                                        : "Terminer la course",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                //color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 22,
                            bottom: 5,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Durée : ${getDuree('${e['heureDepart']}', '${e['heureArrive']}')}",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            //
                            showSimpleModal(
                                InfoSupplementaire(
                                  details: e,
                                ),
                                context);
                          },
                          leading: const Icon(CupertinoIcons.gauge),
                          title: const Text("Informations supplémentaire"),
                          subtitle: const Text("Détails"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            //showSimpleModal(Reservation(), context);
                            //Get.dialog(widget)//Lieu
                            showSimpleModal(Lieu(0), context);
                            //
                          },
                          //airline_seat_recline_extra_rounded
                          leading: Icon(CupertinoIcons.bus),
                          title: Text("Emplacement du bus actuellement"),
                          subtitle: Text("Kongo central / Boma"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(ArretsDetails(
                              e['troncons'],
                              0,
                            ));
                          },
                          leading: Icon(Icons.location_on_outlined),
                          title: Text("Arrets"),
                          subtitle: Text("$arrs arrets"),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(Plus(e));
                          },
                          leading: Icon(Icons.info_outline),
                          title: Text("Plus"),
                          subtitle: Text("..."),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                        // Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Padding(
                        //       padding: EdgeInsets.only(left: 20, bottom: 10),
                        //       child: Text("Arrets"),
                        //     )),
                        // //Trajectoire(),
                        // //Trajectoire(),//
                        // Timeline.tileBuilder(
                        //   shrinkWrap: true,
                        //   physics: ClampingScrollPhysics(),
                        //   builder: TimelineTileBuilder.fromStyle(
                        //     contentsAlign: ContentsAlign.basic,
                        //     contentsBuilder: (context, index) {
                        //       Map a = e['troncons'][index];
                        //       return Padding(
                        //         padding: const EdgeInsets.all(4.0),
                        //         child: ListTile(
                        //           title: Text("${a['arretDepart']['nom']}"),
                        //           subtitle: Text("${a['arretArrive']['nom']}"),
                        //         ),
                        //       );
                        //     },
                        //     itemCount: e['troncons'].length,
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              );
            },
            onEmpty: Container(),
            onLoading: const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.getAllCoures();
            },
            backgroundColor: Colors.indigo.shade900,
            child: Icon(
              Icons.sync_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //
  String getDateDepart(String date) {
    int year = int.parse(date.split(" ")[0].split("-")[0]);
    int month = int.parse(date.split(" ")[0].split("-")[1]);
    int day = int.parse(date.split(" ")[0].split("-")[2]);
    DateTime d = DateTime(year, month, day);
    //
    //print("Le jour: ${d.weekday}");
    List jours = ['', 'lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'];
    List mois = [
      '',
      'Jan',
      'Fev',
      'Mar',
      'Avr',
      'Mais',
      'Juin',
      'Juil',
      'Aout',
      'Sep',
      'Oct',
      'Nov',
      'Déc'
    ];
    //
    return "${jours[d.weekday]} $day ${mois[month]}";
  }

  String getDuree(String dateDepart, String dateArrive) {
    int year1 = int.parse(dateDepart.split(" ")[0].split("-")[0]);
    int month1 = int.parse(dateDepart.split(" ")[0].split("-")[1]);
    int day1 = int.parse(dateDepart.split(" ")[0].split("-")[2]);
    //
    int heure1 = int.parse(dateDepart.split(" ")[1].split(":")[1]);
    int min1 = int.parse(dateDepart.split(" ")[1].split(":")[2]);
    DateTime d1 = DateTime(year1, month1, day1, heure1, min1);
    //
    int year2 = int.parse(dateArrive.split(" ")[0].split("-")[0]);
    int month2 = int.parse(dateArrive.split(" ")[0].split("-")[1]);
    int day2 = int.parse(dateArrive.split(" ")[0].split("-")[2]);
    //
    int heure2 = int.parse(dateArrive.split(" ")[1].split(":")[1]);
    int min2 = int.parse(dateArrive.split(" ")[1].split(":")[2]);
    DateTime d2 = DateTime(year2, month2, day2, heure2, min2);
    //
    Duration heure = d2.difference(d1);
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "${heure.inHours} h";
  }

  //
}

class TicketQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    //
                    Get.back();
                    //
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Votre Qrcode",
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),

                //                           Text(
                //   "Info trajet",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //
                        //Get.back();
                        //
                      },
                      icon: const Icon(
                        CupertinoIcons.bus,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Transco Métro\n",
                        children: [
                          TextSpan(
                            text: "vers Boma",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("LOGO")
              ],
            ),
          ),
          Container(
            height: Get.size.height / 2,
            width: Get.size.width / 1.2,
            alignment: Alignment.center,
            child: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 250,
            ),
          )
        ],
      ),
    );
  }
}
