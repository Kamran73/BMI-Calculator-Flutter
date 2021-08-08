import 'package:flutter/material.dart';
class ChildCard extends StatelessWidget {
  ChildCard({this.icon, this.texT, this.colour});
  final IconData icon;
  final int colour;
  final String texT;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(colour),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          texT,
          style: TextStyle(
            fontSize: 18,
            color: Color(colour),
          ),
        )
      ],
    );
  }
}