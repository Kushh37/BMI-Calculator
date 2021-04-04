import 'package:bmicalculator/Components/bottom_button.dart';
import 'package:bmicalculator/Components/card.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class Results extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const Results(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Center(
                child: Text(
                  'Results',
                  style: sLabelTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUsableCard(
              colour: sInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: sResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: sBMITextStyle,
                  ),
                  Text(
                    'Normal BMI Range :\n18.5 - 24.9Kg/m²',
                    style: TextStyle(
                      color: aIcon,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      color: Color(0xFF8A8B96),
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
