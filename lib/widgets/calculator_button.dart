import 'package:flutter/material.dart';

class calculatorButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callback;

  const calculatorButton(
      {required this.text, required this.textSize, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
