import 'package:flutter/material.dart';



 Widget apartmentPrice(BuildContext context) {
  return Row(

    children: [
      Text(
        "\$250",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Theme.of(context).primaryColor),
      ),
      const Text("/Month",
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w100,
          )),
    ],
  );
}

