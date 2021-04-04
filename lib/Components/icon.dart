import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.colour, this.onTap});

  final IconData icon;
  final String label;
  final Color colour;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100.0,
          color: colour,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: sLabelForIcon,
        )
      ],
    );
  }
}
