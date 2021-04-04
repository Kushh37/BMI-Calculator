import 'package:bmicalculator/Components/bottom_button.dart';
import 'package:bmicalculator/Components/card.dart';
import 'package:bmicalculator/Components/icon.dart';
import 'package:bmicalculator/Components/round_icon_button.dart';
import 'package:bmicalculator/Screens/results.dart';
import 'package:bmicalculator/bmi_store.dart';
import 'package:bmicalculator/calculator.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

enum Sex { Male, Female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BMIStore store = VxState.store as BMIStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: VxBuilder(
              mutations: {ChangeGender},
              builder: (context, _) => Row(
                children: <Widget>[
                  Expanded(
                    child: ReUsableCard(
                      colour: store.maleCardColor,
                      onPress: () => ChangeGender(Sex.Male),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      colour: store.femaleCardColor,
                      onPress: () => ChangeGender(Sex.Female),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        colour: aIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: VxBuilder(
              mutations: {ChangeHeight},
              builder: (context, _) => ReUsableCard(
                colour: sInactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: sLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          store.height.toString(),
                          style: sNumberTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: sLabelForIcon,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () => ChangeHeight(store.height - 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () => ChangeHeight(store.height + 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: VxBuilder(
                    mutations: {ChangeWeight},
                    builder: (context, _) => ReUsableCard(
                      colour: sInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: sLabelTextStyle,
                          ),
                          Text(
                            store.weight.toString(),
                            style: sNumberTextStyle,
                          ),
                          Text(
                            ' Kg',
                            style: sLabelForIcon,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => ChangeWeight(store.weight - 1),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => ChangeWeight(store.weight + 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: VxBuilder(
                    mutations: {ChangeAge},
                    builder: (context, _) => ReUsableCard(
                      colour: sInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: sLabelTextStyle,
                          ),
                          Text(
                            store.age.toString(),
                            style: sNumberTextStyle,
                          ),
                          Text(
                            ' Yr',
                            style: sLabelForIcon,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => ChangeAge(store.age - 1),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => ChangeAge(store.age + 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                Calculator calc =
                    Calculator(height: store.height, weight: store.weight);
                final bmi = calc.calculateBMI();
                final result = calc.getResults();
                final interpretation = calc.getInterpretation();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      bmiResult: bmi,
                      resultText: result,
                      interpretation: interpretation,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
