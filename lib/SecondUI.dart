import 'package:bmi_calculator/ResultContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
   String bmiResult;

   String resultText;

   String quote;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments ;
    bmiResult = arguments['finalresult'];
    quote = arguments['quote'];
    resultText = arguments['resultval'];
    print (bmiResult);
    print (quote);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: ResultContainer(resultText: bmiResult,quote: quote, resultval: resultText,)),
          GestureDetector(
            onTap: (){
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Container(
              color: Color(0xFFeb1555),
              width: double.infinity,
              height: 70,
              child: Center(
                child: Text('Re-Calculate BMI',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, wordSpacing: 1.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
