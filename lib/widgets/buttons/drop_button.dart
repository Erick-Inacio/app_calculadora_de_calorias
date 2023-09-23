import 'package:app_imc/themes/light_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    super.key,
    required this.list,
    this.hint = "",
    required this.nameField,
  });

  final List<String> list;
  final String hint;
  final String nameField;

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  late String aux;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField2<String>(
          iconStyleData: const IconStyleData(
            iconEnabledColor: colorTheme,
          ),
          menuItemStyleData: const MenuItemStyleData(
            overlayColor: MaterialStatePropertyAll(colorTheme),
          ),
          isExpanded: true,
          validator: (value) {
            if (value == null) {
              return 'Selecione uma opção';
            } else {
              return null;
            }
          },
          decoration: const InputDecoration(
            iconColor: colorTheme,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(15),
            //   ),
            //   borderSide: BorderSide(
            //     color: colorTheme,
            //   ),
            // ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: colorTheme,
              ),
            ),
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 350,
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.white,
            ),
          ),
          hint: Text(
            widget.nameField,
            style: const TextStyle(
              fontSize: 20,
              color: colorTheme,
            ),
          ),
          
          items: widget.list
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: colorTheme,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              aux = value.toString();
            });
          },
        ),
        const Divider(),
      ],
    );
  }
}
