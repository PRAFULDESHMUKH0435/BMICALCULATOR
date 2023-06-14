import 'package:flutter/material.dart';
import 'package:prog1/calculator.dart';

class ResultPage extends StatelessWidget {
  Color inactivecolor = Colors.white30;
  Color activecolor = Colors.pink;
  final String bmiresult;
  final String resulttext;
  final String interpretation;

  ResultPage(
      {required this.bmiresult,
      required this.resulttext,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            margin: EdgeInsets.all(15.0),
            color: inactivecolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      bmiresult,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    resulttext.toUpperCase(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    interpretation,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: activecolor, width: 5.0),
                    color: inactivecolor,
                    borderRadius: BorderRadius.circular(25.0)),
                margin: EdgeInsets.all(15.0),
                height: 100,
                child: Center(
                  child: Text(
                    'RE- CALCULATE',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
