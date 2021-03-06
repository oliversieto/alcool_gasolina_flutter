import 'dart:ffi';

import 'package:alcool_gasolina/widgets/input.widget.dart';
import 'package:alcool_gasolina/widgets/loading-button.widget.dart';
import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  MoneyMaskedTextController _gasCtrl = new MoneyMaskedTextController();
  MoneyMaskedTextController _alcCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Compensa utilizar álcool',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: 'Big Shoulders Display',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                LoadingButton(
                  busy: false,
                  invert: true,
                  func: () {},
                  text: 'CALCULAR NOVAMENTE',
                ),
              ],
            ),
          ),
          Input(
            label: 'Gasolina',
            ctrl: _gasCtrl,
          ),
          Input(
            label: 'Álcool',
            ctrl: _alcCtrl,
          ),
          LoadingButton(
            busy: false,
            invert: false,
            func: () {},
            text: 'CALCULAR',
          ),
        ],
      ),
    );
  }
}
