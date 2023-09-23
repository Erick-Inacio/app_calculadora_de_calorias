import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  final Text text;
  final void Function()? onPressed;
  const MyElevatedButton({
    super.key,
    this.onPressed,
    this.text = const Text(
      'button',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  });

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onPressed?.call();
        },
        child: widget.text);
  }
}
