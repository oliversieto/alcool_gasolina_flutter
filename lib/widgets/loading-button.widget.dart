import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  bool busy = false;
  bool invert = false;
  Function func;
  String text = '';

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.func,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(
                  color: invert ? Colors.white : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: 'Big Shoulders Display',
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
