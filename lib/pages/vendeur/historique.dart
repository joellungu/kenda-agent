import 'package:flutter/material.dart';

class Historique extends StatelessWidget {
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
            body: ListView(children: [
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
                              child: Text("Historique des billets achetés"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
