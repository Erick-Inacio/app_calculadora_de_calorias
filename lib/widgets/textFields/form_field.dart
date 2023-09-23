import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? errorText;
  final bool string;
  final TextInputType inputType;
  final String? label;

  const MyFormField({
    super.key,
    this.controller,
    this.errorText,
    this.inputType = TextInputType.number,
    this.label,

    ///false se [string] for um double
    this.string = true,
  });

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.green[700],
      ),
      controller: widget.controller,
      validator: (value) {
        //ele valida se string é false e se for, testa se ele é um double
        if (!widget.string) {
          double? aux = double.tryParse(value!);
          if (aux == null) {
            return widget.errorText;
          }
          // se for true, valida se a string não está vazia ou nula
        } else if (value!.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      keyboardType: widget.inputType,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
      textAlign: TextAlign.center,
    );
  }
}
