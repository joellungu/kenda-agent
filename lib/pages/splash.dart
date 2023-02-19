import 'dart:async';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/application/application_controller.dart';
import 'package:kenda_agent/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'course/course_controller.dart';
import 'course/lieu_controller.dart';
import 'login/login_controller.dart';
import 'profil/profil_controller.dart';
import 'vendeur/vendeur_controller.dart';

class Splash extends StatelessWidget {
  //
  ApplicationController applicationController =
      Get.put(ApplicationController());
  //
  LoginController loginController = Get.put(LoginController());
  //
  VendeurController vendeurController = Get.put(VendeurController());
  //
  CourseController courseController = Get.put(CourseController());
  //
  ProfilController profilController = Get.put(ProfilController());
  //
  LieuController lieuController = Get.put(LieuController());
  //
  Splash() {
    Timer(const Duration(seconds: 3), () {
      Get.off(Login());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("Kenda"),
      ),
    );
  }
}
