import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prog1/calculator.dart';
import 'package:prog1/resultpage.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //////////////////////
  double selectedvalue = 3.0;
  Gender selectedgender = Gender.male;
  double selectedage = 21;
  double selectedweight = 40;

  double currentvalue = 3.0;
  int userweight = 40;
  int userage = 21;
  Color inactivecolor = Colors.white30;
  Color activecolor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.dumbbell),
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              maleexpand(),
              femaleexpand(),
            ],
          ),
          Row(
            children: [
              heightchooser()
              // maleexpand(),
            ],
          ),
          Row(
            children: [
              weight(),
              age(),
            ],
          ),
          calculatebutton(),
        ],
      )),
    );
  }

  Expanded maleexpand() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedgender = Gender.male;
            print(selectedgender);
          });
        },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: selectedgender == Gender.male ? activecolor : inactivecolor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.mars, size: 80),
              Text(
                'MALE',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded femaleexpand() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedgender = Gender.female;
          });
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color:
                selectedgender == Gender.female ? activecolor : inactivecolor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.venus, size: 80),
              Text(
                'FEMALE',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded heightchooser() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              '$currentvalue' ' Ft',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            Slider(
                value: currentvalue,
                label: currentvalue.toString(),
                min: 3.0,
                max: 8.0,
                onChanged: (newvalue) {
                  setState(() {
                    var num1 = newvalue;
                    var num2 =
                        double.parse(num1.toStringAsFixed(2)); // num2 = 10.12
                    currentvalue = num2;
                    selectedvalue = num2;
                  });
                })
          ],
        ),
      ),
    );
  }

  Expanded weight() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 40),
              child: Text(
                'Weight',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Text(
              '$userweight',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        userweight++;
                        selectedweight = userweight.toDouble();
                      });
                    },
                    child: Container(
                      color: Colors.white60,
                      margin: const EdgeInsets.only(left: 22.0, right: 10.0),
                      child: Icon(
                        FontAwesomeIcons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (userweight == 0) {
                          return;
                        }
                        userweight--;
                        selectedweight = userweight.toDouble();
                      });
                    },
                    child: Container(
                      color: Colors.white60,
                      margin: EdgeInsets.only(left: 10.0, right: 22.0),
                      child: Icon(
                        FontAwesomeIcons.minus,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded age() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 40),
              child: Text(
                'Age',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Text(
              '$userage',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (userage == 100) {
                          return;
                        }
                        userage++;
                        selectedage = userage.toDouble();
                      });
                    },
                    child: Container(
                      color: Colors.white60,
                      margin: const EdgeInsets.only(left: 22.0, right: 10.0),
                      child: Icon(
                        FontAwesomeIcons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (userage == 0) {
                          return;
                        }
                        userage--;
                        selectedage = userage.toDouble();
                      });
                    },
                    child: Container(
                      color: Colors.white60,
                      margin: const EdgeInsets.only(left: 10.0, right: 22.0),
                      child: const Icon(
                        FontAwesomeIcons.minus,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded calculatebutton() {
    return Expanded(
      child: InkWell(
        onTap: () {
          /// calculate
          Calculate calc =
              Calculate(height: selectedvalue, weight: selectedweight);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiresult: calc.CalculateBMI(),
                      resulttext: calc.getResult(),
                      interpretation: calc.getInterpretation())));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Center(
            child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(20.0)),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 90,
        ),
      ),
    );
  }
}

///
/// BMI Categories:
// Underweight = <18.5
// Normal weight = 18.5–24.9
// Overweight = 25–29.9
// Obesity = BMI of 30 or greater
///
