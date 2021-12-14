import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameboard/logic/tictactoelogic.dart';

class TicTacToeGame extends StatefulWidget {
  final int whichPlayer;
  final bool colorChangeControl;

  TicTacToeGame({
    @required this.whichPlayer,
    @required this.colorChangeControl,
  });

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState(
        whichPlayer: this.whichPlayer,
        colorChangeControl: this.colorChangeControl,
      );
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  _TicTacToeGameState({
    @required this.whichPlayer,
    @required this.colorChangeControl,
  });

  static TicTacToeLogic tttLogicController = TicTacToeLogic();

  static final String endMessage = 'Start again';
  static final String winnerMessage = 'WE HAVE A WINNER';
  static final String playerOneWinnerMessage = 'Player 1 won!';
  static final String playerTwoWinnerMessage = 'Player 2 won!';
  static final Color playerTwoColor = Colors.lightBlue[100];
  static final Color playerOneColor = Colors.lightBlue[900];
  static final Color buttonColor = Colors.white;
  int whichPlayer;
  bool colorChangeControl;

  // Matrix way to know the buttons in the tic tac toe
  // color button[column][row]
  Color button11 = buttonColor;
  Color button12 = buttonColor;
  Color button13 = buttonColor;
  Color button21 = buttonColor;
  Color button22 = buttonColor;
  Color button23 = buttonColor;
  Color button31 = buttonColor;
  Color button32 = buttonColor;
  Color button33 = buttonColor;

  // To control click
  List<int> clicks = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  List<BoxShadow> shadowBox = [
    BoxShadow(color: Colors.blue[700], spreadRadius: 15, blurRadius: 15),
    BoxShadow(color: Colors.lightBlue[700], spreadRadius: 5),
  ];

  void addTapOnTicTacToe(int possibleWin, int index, int whichPlayer,
      bool colorChangeControl, Color button, List<int> clicks,
      Color playerColor) {
    if (clicks[index] == 0) {
      possibleWin =
          tttLogicController.oneMove(index, whichPlayer);

      if (whichPlayer == 1) {
        whichPlayer = 2;
      } else if (whichPlayer == 2) {
        whichPlayer = 1;
      }

      colorChangeControl = !colorChangeControl;
      button = playerColor;
      clicks[index] += 1;

      print(clicks);
      print(index);
      print(whichPlayer);
      print(button);
      print(playerColor);
      print(colorChangeControl);
      print(possibleWin);
    }
  }

  void clearGameTicTacToe(List<int> clicks) {
    tttLogicController.clearTicTacToe();
    for (int i = 0; i <= 8; i++)
      clicks[i] = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      heightFactor: 0.6,
      widthFactor: 0.85,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: shadowBox,
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button11,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            // addTapOnTicTacToe(possibleWin, 0, whichPlayer,
                            //     colorChangeControl, button11, clicks,
                            //     playerOneColor);
                            if (clicks[0] == 0) {
                              possibleWin =
                                  tttLogicController.oneMove(0, whichPlayer);
                              whichPlayer = 2;
                              colorChangeControl = !colorChangeControl;
                              button11 = playerOneColor;
                              clicks[0] += 1;
                            }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 0, whichPlayer,
                                colorChangeControl, button11, clicks,
                                playerTwoColor);
                            // if (clicks[0] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(0, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button11 = playerTwoColor;
                            //   clicks[0] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button21,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 3, whichPlayer,
                                colorChangeControl, button21, clicks,
                                playerOneColor);
                            // if (clicks[3] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(3, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button21 = playerOneColor;
                            //   clicks[3] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 3, whichPlayer,
                                colorChangeControl, button21, clicks,
                                playerTwoColor);
                            // if (clicks[3] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(3, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button21 = playerTwoColor;
                            //   clicks[3] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button31,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 6, whichPlayer,
                                colorChangeControl, button31, clicks,
                                playerOneColor);
                            // if (clicks[6] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(6, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button31 = playerOneColor;
                            //   clicks[6] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 6, whichPlayer,
                                colorChangeControl, button31, clicks,
                                playerTwoColor);
                            // if (clicks[6] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(6, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button31 = playerTwoColor;
                            //   clicks[6] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 1, whichPlayer,
                                colorChangeControl, button12, clicks,
                                playerOneColor);
                            // if (clicks[1] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(1, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button12 = playerOneColor;
                            //   clicks[1] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 1, whichPlayer,
                                colorChangeControl, button12, clicks,
                                playerTwoColor);
                            // if (clicks[1] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(1, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button12 = playerTwoColor;
                            //   clicks[1] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button22,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 4, whichPlayer,
                                colorChangeControl, button22, clicks,
                                playerOneColor);
                            // if (clicks[4] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(4, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button22 = playerOneColor;
                            //   clicks[4] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 4, whichPlayer,
                                colorChangeControl, button22, clicks,
                                playerTwoColor);
                            // if (clicks[4] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(4, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button22 = playerTwoColor;
                            //   clicks[4] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button32,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 7, whichPlayer,
                                colorChangeControl, button32, clicks,
                                playerOneColor);
                            // if (clicks[7] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(7, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button32 = playerOneColor;
                            //   clicks[7] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 7, whichPlayer,
                                colorChangeControl, button32, clicks,
                                playerTwoColor);
                            // if (clicks[7] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(7, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button32 = playerTwoColor;
                            //   clicks[7] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button13,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 2, whichPlayer,
                                colorChangeControl, button13, clicks,
                                playerOneColor);
                            // if (clicks[2] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(2, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button13 = playerOneColor;
                            //   clicks[2] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 2, whichPlayer,
                                colorChangeControl, button13, clicks,
                                playerTwoColor);
                            // if (clicks[2] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(2, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button13 = playerTwoColor;
                            //   clicks[2] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button23,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 5, whichPlayer,
                                colorChangeControl, button23, clicks,
                                playerOneColor);
                            // if (clicks[5] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(5, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button23 = playerOneColor;
                            //   clicks[5] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 5, whichPlayer,
                                colorChangeControl, button23, clicks,
                                playerTwoColor);
                            // if (clicks[5] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(5, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button23 = playerTwoColor;
                            //   clicks[5] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                        minHeight: 40,
                        minWidth: 40),
                    child: Container(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: button33,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        onPressed: () => setState(() {
                          if (colorChangeControl == true) {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 8, whichPlayer,
                                colorChangeControl, button33, clicks,
                                playerOneColor);
                            // if (clicks[8] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(8, whichPlayer);
                            //   whichPlayer = 2;
                            //   colorChangeControl = !colorChangeControl;
                            //   button33 = playerOneColor;
                            //   clicks[8] += 1;
                            // }
                            if (possibleWin == 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerOneWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          } else {
                            int possibleWin;
                            addTapOnTicTacToe(possibleWin, 8, whichPlayer,
                                colorChangeControl, button33, clicks,
                                playerTwoColor);
                            // if (clicks[8] == 0) {
                            //   possibleWin =
                            //       tttLogicController.oneMove(8, whichPlayer);
                            //   whichPlayer = 1;
                            //   colorChangeControl = !colorChangeControl;
                            //   button33 = playerTwoColor;
                            //   clicks[8] += 1;
                            // }
                            if (possibleWin == 2) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      actions: <Widget>[
                                        ElevatedButton(
                                          // color: Theme.of(context).buttonColor,
                                          onPressed: () => setState(() {
                                            clearGameTicTacToe(clicks);
                                            // tttLogicController.clearTicTacToe();
                                            // for (int i = 0; i <= 8; i++)
                                            //   clicks[i] = 0;
                                          }),
                                          child: Text(endMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                        )
                                      ],
                                      title: Text(winnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      content: Text(playerTwoWinnerMessage,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    );
                                  });
                            }
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
