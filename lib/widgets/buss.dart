import 'package:flutter/material.dart';

class Buss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        columnWidths: {2: FractionColumnWidth(.05)},
        defaultColumnWidth: FractionColumnWidth(0.24),
        children: List.generate(
          12,
          (index) {
            return TableRow(
              children: List.generate(
                5,
                (index) {
                  if (index != 2) {
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.chair_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          },
        ),
      ),
    );

    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 1,
      children: List.generate(
        40,
        (index) => Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.chair_outlined,
            color: Colors.grey,
            size: 70,
          ),
        ),
      ),
    );
  }
}
