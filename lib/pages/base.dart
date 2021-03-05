import 'package:flutter/material.dart';
import 'package:gameboard/pages/tictactoe/ttthome.dart';

class Base extends StatelessWidget {
  final List<Shadow> shadowTextLight = [
    Shadow(blurRadius: 15, color: Colors.lightBlue[800]),
    Shadow(blurRadius: 15, color: Colors.blue[800]),
  ];

  final List<Shadow> shadowTextDark = [
    Shadow(blurRadius: 5, color: Colors.lightBlue[400]),
    Shadow(blurRadius: 5, color: Colors.blue[400]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games',
      home: TicTacToeHome(),
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
        secondaryHeaderColor: Colors.lightBlue[100],
        buttonColor: Colors.white,
        backgroundColor: Colors.lightBlue[400],
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Bungee',
            color: Colors.lightBlue[900],
            fontSize: 42,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Bungee',
            color: Colors.lightBlue[100],
            fontSize: 42,
          ),
          headline3: TextStyle(
              color: Colors.white, fontFamily: 'Bungee', fontSize: 24),
          headline6: TextStyle(
              color: Colors.white,
              fontSize: 42,
              shadows: shadowTextLight,
              wordSpacing: 1,
              letterSpacing: 2,
              fontFamily: 'Bungee'),
          button: TextStyle(color: Colors.lightBlue[400], fontFamily: 'Bungee'),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.lightBlue[900],
        secondaryHeaderColor: Colors.lightBlue[100],
        buttonColor: Colors.lightBlue[400],
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Bungee',
            color: Colors.lightBlue[900],
            fontSize: 42,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Bungee',
            color: Colors.lightBlue[100],
            fontSize: 42,
          ),
          headline3: TextStyle(
              color: Colors.lightBlue[400], fontFamily: 'Bungee', fontSize: 24),
          headline6: TextStyle(
            color: Colors.lightBlue[400],
            fontSize: 42,
            shadows: shadowTextDark,
            wordSpacing: 1,
            letterSpacing: 2,
            fontFamily: 'Bungee',
          ),
          button: TextStyle(color: Colors.black, fontFamily: 'Bungee'),
        ),
      ),
    );
  }
}
