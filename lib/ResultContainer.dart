import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  ResultContainer({this.quote,  this.resultText, this.resultval});

 final String resultval;
  final String resultText;
  final String quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF1d1f33),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                resultval.toUpperCase(),
                style: TextStyle(color: Color(0xFF22e67b), fontSize: 30.0, letterSpacing: 0.8),
              ),
            ),
            Text(
              resultText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.w900),
            ),
            Column(
              children: [
                Text(
                  'Normal BMI Range:',
                  style: TextStyle(
                      color: Color(0xFF727380),
                      fontSize: 35.0,),
                ),
                SizedBox(height: 10,),
                Text(
                  '18.5 - 24.9 kg/m2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                quote,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
