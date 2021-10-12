// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mytodolist/widgets/calculator_button.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  String history = '';
  String textToDisplay = '';
  late String res; // intermidiate result value
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[800],
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: TextStyle(fontSize: 24, color: Color(0x66FFFFFF)),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                  text: 'AC',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                calculatorButton(
                  text: 'C',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                calculatorButton(
                  text: '<',
                  textSize: 20,
                  callback: btnOnClick,
                ),
                calculatorButton(
                  text: '/',
                  textSize: 20,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(text: '8', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '9', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '7', textSize: 20, callback: btnOnClick),
                calculatorButton(text: 'X', textSize: 20, callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(text: '6', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '5', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '4', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '-', textSize: 20, callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(text: '3', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '2', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '1', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '+', textSize: 20, callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton(
                    text: '+/-', textSize: 18, callback: btnOnClick),
                calculatorButton(text: '0', textSize: 20, callback: btnOnClick),
                calculatorButton(
                    text: '00', textSize: 20, callback: btnOnClick),
                calculatorButton(text: '=', textSize: 20, callback: btnOnClick),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
