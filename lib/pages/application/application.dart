import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/application/application_controller.dart';
import 'package:kenda_agent/pages/vendeur/vendeur.dart';

import '../accueil/accueil.dart';

class Application extends GetView<ApplicationController> {
  Map infos;
  Application(this.infos) {
    controller.getCourses();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Status bar color
      child: Scaffold(
        body: infos['role'] == 4 ? Vendeur() : Accueil(),
      ),
    );
  }
}
