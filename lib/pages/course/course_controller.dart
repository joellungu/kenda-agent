import 'package:get/get.dart';
import 'package:kenda_agent/pages/login/login_controller.dart';
import 'package:kenda_agent/utils/requete.dart';

class CourseController extends GetxController with StateMixin<Map> {
  LoginController loginController = Get.find();

  getAllCoures() async {
    Map i = loginController.infos;
    Requete requete = Requete();
    //
    Response rep =
        await requete.getE("courses/all/${i['idPartenaire']}/${i['id']}");
    if (rep.isOk) {
      //
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change({}, status: RxStatus.empty());
    }
    //
  }
}
