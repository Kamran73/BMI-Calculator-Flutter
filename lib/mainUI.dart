import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'childcard.dart';
import 'cardwidget.dart';
import 'Calculator.dart';
const int activeColor = 0xFFffffff;
const int inactiveColor = 0xFF8d8e98;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _maleColor = inactiveColor;
  int _femaleColor = inactiveColor;

  bool IsiInActive(int color) {
    if (color == inactiveColor) {
      return true;
    } else
      return false;
  }
  int _weight = 50;
  int _value = 120;
  int _age  = 20;
  double _wightIntoPounds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (IsiInActive(_maleColor) == true) {
                        setState(() {
                          _maleColor = activeColor;
                          _femaleColor = inactiveColor;
                        });
                      }
                    },
                    child: CardWidget(
                      color: Color(0xFF1d1f33),
                      cardChild: ChildCard(
                        icon: FontAwesomeIcons.mars,
                        texT: 'MALE',
                        colour: _maleColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (IsiInActive(_femaleColor) == true) {
                        setState(() {
                          _femaleColor = activeColor;
                          _maleColor = inactiveColor;
                        });
                      }
                    },
                    child: CardWidget(
                      color: Color(0xFF1d1f33),
                      cardChild: ChildCard(
                        icon: FontAwesomeIcons.venus,
                        texT: 'FEMALE',
                        colour: _femaleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardWidget(
              color: Color(0xFF1d1f33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF848690),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _value.toString(),
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        ' cm',
                        style: TextStyle(
                          color: Color(0xFF848690),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFeb1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      overlayColor: Color(0x29eb1555),
                    ),
                    child: Slider(
                      value: _value.toDouble(),
                      max: 220,
                      min: 120,
                      inactiveColor: Color(0xFF888993),
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    color: Color(0xFF1d1f33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT (KG)',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF848690),
                          ),
                        ),
                        Text(
                          _weight.toString()
                          ,
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _weight--;
                                });
                              },
                              child: RoundedButton(
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                            SizedBox(width: 15,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _weight++;
                                });
                              },
                              child: RoundedButton(
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    color: Color(0xFF1d1f33), cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE (YEAR)',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF848690),
                        ),
                      ),
                      Text(
                        _age.toString()
                        ,
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                _age--;
                              });
                            },
                            child: RoundedButton(
                              icon: FontAwesomeIcons.minus,
                            ),
                          ),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _age++;
                              });
                            },
                            child: RoundedButton(
                              icon: FontAwesomeIcons.plus,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Calculator calc = Calculator(height: _value, weight: _weight);
              String finalresult = calc.CalculateBMI();
              String interpret = calc.GetInterperception();
              String resultval = calc.GetResult();
              print(finalresult);
              print(interpret);
              Navigator.pushNamed(context, '/second', arguments: {
                'finalresult': finalresult , 'quote': interpret, 'resultval': resultval
              },);
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: Color(0xFFeb1555),
              child: Center(
                  child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, wordSpacing: 1.5),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Color(0x26848690),
        //color: Colors.red,
      ),
      child: Icon(icon),
    );
  }
}
