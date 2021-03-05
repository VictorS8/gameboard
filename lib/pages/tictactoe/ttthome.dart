import 'package:flutter/material.dart';
import 'package:gameboard/pages/titlegame.dart';
import 'package:gameboard/pages/tictactoe/tttbottom.dart';
import 'package:gameboard/pages/tictactoe/tttgame.dart';

class TicTacToeHome extends StatefulWidget {
  @override
  _TicTacToeHomeState createState() => _TicTacToeHomeState();
}

class _TicTacToeHomeState extends State<TicTacToeHome> {
  int whichPlayer = 1;
  bool colorChangeControl = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: TitleGame(
              title: 'TIC TAC TOE',
            ),
          ),
          Flexible(
              flex: 6,
              child: Center(
                child: TicTacToeGame(
                  whichPlayer: whichPlayer,
                  colorChangeControl: colorChangeControl,
                ),
              )),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: TicTacToeBottom(
              colorChangeControl: colorChangeControl,
            ),
          ),
        ],
      ),
    );
  }
}
