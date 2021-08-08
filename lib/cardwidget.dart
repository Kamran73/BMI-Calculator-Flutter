import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  CardWidget({@required this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color,
        //color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}