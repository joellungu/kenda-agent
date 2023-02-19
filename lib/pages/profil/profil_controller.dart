import 'dart:convert';

import 'package:get/get.dart';
import 'package:kenda_agent/pages/login/login_controller.dart';
import 'package:kenda_agent/utils/requete.dart';

class ProfilController extends GetxController {
  Requete requete = Requete();
  //
  RxMap infos = RxMap();
  //
  LoginController loginController = Get.find();
  //

  miseAjour(Map data) async {
    Map e = loginController.infos;
    Response rep = await requete.putE("agents/${e['id']}", data);
    if (rep.isOk) {
      Get.back();
      print("La reponse du serveur: ${rep.body}");
      print("La reponse du serveur: ${rep.statusCode}");
      Get.back();
      //
      infos.value = jsonDecode(rep.bodyString!);
      print(infos);
      //
      if (infos.value["numero"] != null && infos.value["password"] != null) {
        //
        //Get.off(Application());
        loginController.infos = infos;
        Get.snackbar("Mise à jour", "Mise à jour éffectué");
        //
      } else {
        Get.snackbar(
            "Erreur", "Un problème est survenu, contact votre superviseur");
      }
    } else {
      Get.back();
      print("La reponse du serveur: ${rep.body}");
      print("La reponse du serveur: ${rep.statusCode}");
      Get.back();
      Get.snackbar("Mise à jour erreur", "Code d'erreur: ${rep.statusCode}");
    }
  }
}
