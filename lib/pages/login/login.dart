import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/login/login_controller.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final numero = TextEditingController();
  final mdp = TextEditingController();

  LoginController loginController = Get.find();
  //

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
            centerTitle: true,
            title: const Text(
              "Kenda",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            //child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text(""),
                  TextFormField(
                    controller: numero,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre numéro";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        icon: Icon(Icons.phone_android),
                        prefix: Text(
                          "+243",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Numéro de téléphone"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: mdp,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre mot de passe";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      prefix: Text(
                        "****",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Mot de passe",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade900),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Get.off(Accueil());

                        Get.dialog(
                          Container(
                            height: 40,
                            width: 40,
                            child: const CircularProgressIndicator(),
                            alignment: Alignment.center,
                          ),
                        );

                        loginController.login("243${numero.text}", mdp.text);
                        //loginController.deja.value = true;
                      }
                    },
                    child: Text(
                      "S'authentifier",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              //)
            ),
          ),
        ),
      ),
    );
  }
}
