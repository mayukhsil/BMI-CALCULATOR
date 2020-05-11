import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_cards.dart';
import 'package:bmi_calculator/components/icon_data.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'results.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

  int height = 180;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconData(
                          icon: FontAwesomeIcons.mars, gender: 'MALE')),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconData(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kSmallLabelTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
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
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kSmallLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },),
                        ],
                      ),
                    ],
                  ),),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kSmallLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: () {setState(() {
                              age--;
                            });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: () {setState(() {
                              age++;
                            });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonState: 'CALCULATE',onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonState});
  final Function onTap;
  final String buttonState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonState,
            style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            ),
          ),
        ),
        color: Colors.pink,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
