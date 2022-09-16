import 'package:flutter/material.dart';

// this is the container which wraps the
// tourist sites image
Widget ImgContainer(BuildContext context, String img, String text) {
  var _screenSize = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              color: Colors.white,
              /*  boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ],*/
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          constraints: BoxConstraints.expand(
            width: _screenSize.width < 1000 ? 150 : 200,
            height: _screenSize.width < 1000 ? 180 : 240,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ],
    ),
  );
}
