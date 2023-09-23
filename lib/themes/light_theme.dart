import 'package:flutter/material.dart';

const Color colorTheme = Colors.green;
const Color colorThemeClear = Colors.lightGreen;

const TextStyle headOne = TextStyle(
  color: colorTheme,
  fontSize: 20,
);

const TextStyle bodyOne = TextStyle(
  color: colorTheme,
);

const TextStyle appBarTitle =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500);

const TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  //cores principais do app
  primaryColor: colorTheme,
  secondaryHeaderColor: Colors.greenAccent,

  //thema dos inputDecorations
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: colorTheme),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: colorTheme,
      ),
    ),
    labelStyle: TextStyle(
      color: colorTheme,
      fontSize: 20,
    ),
  ),

  //tema dos textos
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: headOne,
        titleSmall: bodyOne,
        labelLarge: buttonTextStyle,
      ),

  //tema da appbar
  appBarTheme: const AppBarTheme(
    backgroundColor: colorTheme,
    titleTextStyle: appBarTitle,
    centerTitle: true
  ),

  //iconTheme
  // iconTheme: const IconThemeData(
  //   color: Colors.white,
  // ),


  //tema do scaffold
  scaffoldBackgroundColor: Colors.white,

  //tema do ElevatedButton
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size.fromHeight(50),
      backgroundColor: colorTheme,
      foregroundColor: Colors.white,
    ),
  ),

  //Divider
  dividerTheme: const DividerThemeData(
    color: colorTheme,
    space: 1,
  ),

  //DropDownMenu
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: const TextStyle(color: colorTheme),
    menuStyle: MenuStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: colorTheme,
      suffixIconColor: colorTheme,
    ),
  ),
);
