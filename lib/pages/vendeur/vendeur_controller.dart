import 'package:get/get.dart';
import 'package:kenda_agent/pages/login/login_controller.dart';
import 'package:kenda_agent/utils/requete.dart';

class VendeurController extends GetxController {
  //
  LoginController loginController = Get.find();
  //
  Future<List> getAllCoures() async {
    var e = loginController.infos;
    Requete requete = Requete();
    //
    Response rep = await requete.getE("courses/all/${e['idPartenaire']}");
    if (rep.isOk) {
      //
      //change(rep.body, status: RxStatus.success());
      return rep.body;
    } else {
      //
      //change([], status: RxStatus.empty());
      return [];
    }
    //
  }
}
