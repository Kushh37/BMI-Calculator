import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress,
      this.onDoublePress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final Function onDoublePress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      onDoubleTap: onDoublePress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: colour),
      ),
    );
  }
}
