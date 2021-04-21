import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  Color colorDivider = HexColor("#EFEFEF");





  Color textColorDark = HexColor("#0E464A");
  Color textColorGrey = HexColor("#A2A2A2");
  Color textColorGreyLight = HexColor("#BEBEBE");
  Color ColorOrange = HexColor("#F58634");
  Color ColorOrangeLight = HexColor("#F56B36");
  Color ColorBorder = HexColor("#707070");
  Color ColorBorderGrey = HexColor("#9D9D9D");
  Color ColorHintText = HexColor("#BEBEBE");
  Color colorGreenLight = HexColor("#A8CF45");
  Color colorYellowLight = HexColor("#FEC42D");
  Color colorRedDark = HexColor("#FD0D1B");
  Color colorTextOrange = HexColor("#F58634");
  Color colorRedGradient = HexColor("#FC433D");
  Color colorOrangeGradient = HexColor("#DE9858");
  Color colorGreenLightDialog = HexColor("B3BF93");
  Color colorDividerDark = HexColor("#D6D6D6");
  Color colorCapsulBackground = HexColor("#D2E28B");
  Color colorTextGrey = HexColor("#9A9A9A");
  Color colorGreenTick = HexColor("#72C600");
  Color colorGreenTickDark = HexColor("#1CBC33");
  Color colorYellowTick = HexColor("#DDCC00");
  Color colorRedBright = HexColor("#FD3C3B");
  Color colorGreyLight = HexColor("#ADADAD");
  Color colorAmberLight = HexColor("#FFC400");
  Color colorGreySubtitle = HexColor("#A7A7A7");
  Color colorBackgroundOne = HexColor("#FFE1BE");
  Color colorBackgroundTwo = HexColor("#FECECE");
  Color colorBackgroundThree = HexColor("#FFE08E");
  Color colorBackgroundFour = HexColor("#B7E6FF");
  Color colorBackgroundChallenges = HexColor("#F7FFE2");
  Color colorDescriptionChallenges = HexColor("#A6B469");
  Color colorDialogBorder = HexColor("#E5E5E5");
  Color colorServicesName = HexColor("#8B8B8B");
  Color colorMutraDark = HexColor("#7C0E00");
  Color colorMutraLight = HexColor("#FFF9B7");
  Color colorMutraMid = HexColor("#E2C48E");

  BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: new BorderRadius.only(
      topRight: const Radius.circular(15.0),
      bottomRight: const Radius.circular(15.0),
      topLeft: const Radius.circular(15.0),
      bottomLeft: const Radius.circular(15.0),
    ),
    gradient: LinearGradient(
        colors: [
          HexColor("#FC433D"),
          HexColor("#B3BF93"),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.5, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
