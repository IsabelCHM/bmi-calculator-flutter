import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final Function function;
  NewCard(this.colour, this.cardChild, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}