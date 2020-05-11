import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_cards.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text('Your Results',
                style: kTitleTextStyle,),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(colour: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(),
                style: kResultTextStyle,),
                Text(bmiResult,
                style: kBMITextStyle,),
                Text(interpretation.toUpperCase(),
                style: kBodyResultText,
                textAlign: TextAlign.center,),
              ],
            ),
            ),
          ),
          BottomButton(onTap:  (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
          }, buttonState: 'RE-CALCULATE')
        ],
      )
    );
  }
}
