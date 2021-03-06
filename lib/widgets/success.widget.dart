import 'package:alcool_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  Function reset;
  String result = '';

  Success({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            result,
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
            func: reset,
            text: 'CALCULAR NOVAMENTE',
          ),
        ],
      ),
    );
  }
}
