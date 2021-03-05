import 'package:flutter/material.dart';

class TicTacToeBottom extends StatefulWidget {
  final bool colorChangeControl;
  TicTacToeBottom({
    @required this.colorChangeControl,
  });

  @override
  _TicTacToeBottomState createState() => _TicTacToeBottomState(
        colorChangeControl: this.colorChangeControl,
      );
}

class _TicTacToeBottomState extends State<TicTacToeBottom> {
  bool colorChangeControl;

  _TicTacToeBottomState({
    @required this.colorChangeControl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(64.0))),
          child: Center(
            child: Text('1', style: Theme.of(context).textTheme.bodyText2),
          ),
          constraints: BoxConstraints(
            maxWidth: 80.0,
            maxHeight: 80.0,
            minWidth: 60.0,
            minHeight: 60.0,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              // color: Colors.lightBlue[300],
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.all(
                Radius.circular(64.0),
              )),
          child: Center(
            child: Text('2', style: Theme.of(context).textTheme.bodyText1),
          ),
          constraints: BoxConstraints(
            maxWidth: 80.0,
            maxHeight: 80.0,
            minWidth: 60.0,
            minHeight: 60.0,
          ),
        ),
      ],
    );
  }
}
