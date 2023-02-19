import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/course/reservation.dart';
import 'package:kenda_agent/widgets/modal.dart';

class Itinerance extends StatelessWidget {
  Map e;
  Itinerance(this.e);
  RxString depart = "".obs;
  RxString arrive = "".obs;
  //
  List listeIt = [];
  @override
  Widget build(BuildContext context) {
    listeIt = e['troncons'];
    print(listeIt);
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade900,
            centerTitle: true,
            title: Text(
              "Arrets",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: ListView(
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
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      onChanged: (t) {
                        //
                        depart.value = t;
                      },
                      decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        fillColor: Colors.grey.shade200,

                        label: Text("Lieu de depart"),
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (t) {
                        //
                        arrive.value = t;
                      },
                      decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        fillColor: Colors.grey.shade200,

                        label: Text("Lieu de d'arrivé"),
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(listeIt.length, (index) {
                    RxMap e = RxMap();
                    e.value = listeIt[index];
                    TextEditingController text =
                        TextEditingController(text: "${e['prix']}");
                    if ("${e['arretArrive']['nom']}".contains(arrive.value) ||
                        "${e['arretDepart']['nom']}".contains(depart.value)) {
                      return ListTile(
                        onTap: () async {
                          showSimpleModal(Reservation(), context);
                        },
                        title: Text.rich(
                          TextSpan(
                            text: "Dep: ",
                            children: [
                              TextSpan(
                                text: "${e['arretDepart']['nom']}",
                                style: const TextStyle(
                                  color: Colors.black, //
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                            style: TextStyle(
                              color: Colors.green.shade900, //
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            text: "Arr:   ",
                            children: [
                              TextSpan(
                                text: "${e['arretArrive']['nom']}",
                                style: const TextStyle(
                                  color: Colors.black, //
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                            style: TextStyle(
                              color: Colors.green.shade900, //
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        trailing: Text(
                          "${e['prix']} CDF",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
