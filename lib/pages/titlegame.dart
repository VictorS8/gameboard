import 'package:flutter/material.dart';

class TitleGame extends StatelessWidget {
  final String title;

  TitleGame({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
