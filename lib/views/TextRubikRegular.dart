import 'package:flutter/cupertino.dart';

class TextRubikRegular extends StatelessWidget {

  String title;
  String align;
  double size;
  Color color;
  bool isBold;

  TextRubikRegular(this.title, this.align, this.size, this.color, this.isBold);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title,
        textAlign: align == "left"
            ? TextAlign.start
            : align == "right"
                ? TextAlign.end
                : TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: 'Rubik-dark',
            fontWeight:
                isBold == true ? FontWeight.bold : FontWeight.normal));
  }
}
