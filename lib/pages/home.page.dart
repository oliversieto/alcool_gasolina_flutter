import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.widget.dart';
import 'package:alcool_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  MoneyMaskedTextController _gasCtrl = new MoneyMaskedTextController();
  MoneyMaskedTextController _alcCtrl = new MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = 'Compensa utilizar álcool';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(
            milliseconds: 1200,
          ),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                      busy: _busy,
                      submitFunction: calculate,
                    ),
            ],
          ),
        ));
  }

  void reset() {
    setState(() {
      _gasCtrl = new MoneyMaskedTextController();
      _alcCtrl = new MoneyMaskedTextController();
      _busy = false;
      _completed = false;
      _color = Colors.deepPurple;
    });
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = 'Compensa utilizar Gasolina!';
        } else {
          _resultText = 'Compensa utilizar Álcool!';
        }

        _busy = false;
        _completed = true;
      });
    });
  }
}
