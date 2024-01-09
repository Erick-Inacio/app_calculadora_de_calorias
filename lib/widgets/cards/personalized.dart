import 'package:flutter/material.dart';

class CardPesonalized extends StatefulWidget {
  final String title;
  final String textBody;
  final Color titleCardColor;
  final Color bodyCardColor;
  final Color titleColor;
  final Color bodyColor;

  const CardPesonalized({
    super.key,
    this.textBody = '',
    this.title = '',
    this.titleCardColor = const Color.fromARGB(174, 61, 180, 63),
    this.bodyCardColor = const Color.fromARGB(255, 218, 255, 219),
    this.titleColor = Colors.white,
    this.bodyColor = Colors.green,
  });

  @override
  State<CardPesonalized> createState() => _CardPesonalizedState();
}

class _CardPesonalizedState extends State<CardPesonalized> {
  @override
  Widget build(BuildContext context) {
    //body card
    return Card(
      color: widget.bodyCardColor,
      child: Column(
        children: <Widget>[
          //title card
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Card(
              color: widget.titleCardColor,
              child: Align(
                alignment: Alignment.center,
                //title text
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.titleColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          //body text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.textBody,
              style: TextStyle(
                color: widget.bodyColor,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
