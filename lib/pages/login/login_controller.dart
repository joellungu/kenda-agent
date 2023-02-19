// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/application/application.dart';
import 'package:kenda_agent/utils/requete.dart';

class LoginController extends GetxController {
  Requete requete = Requete();
  //
  RxMap infos = RxMap();
  //

  RxBool deja = false.obs;

  dejaLoger() {
    deja.value = true;
  }

  login(String numero, String mdp) async {
    Response rep = await requete.getE("agents/login/$numero/$mdp");
    if (rep.isOk) {
      print("La reponse du serveur: ${rep.body}");
      print("La reponse du serveur: ${rep.statusCode}");
      Get.back();
      //
      infos.value = jsonDecode(rep.bodyString!);
      print(infos);
      //
      if (infos.value["numero"] != null && infos.value["password"] != null) {
        //
        Get.off(Application(infos.value));
        Get.snackbar("Accepté", "Enregistrement éffectué");
        //
      } else {
        Get.snackbar(
            "Erreur", "Un problème est survenu, contact votre superviseur");
      }
    } else {
      print("La reponse du serveur: ${rep.body}");
      print("La reponse du serveur: ${rep.statusCode}");
      Get.back();
      Get.snackbar("Reffusé", "Code d'erreur: ${rep.statusCode}");
    }
  }
}


//