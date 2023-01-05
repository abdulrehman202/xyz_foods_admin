import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.frontier('#ed9728');
  static Color darkGrey = HexColor.frontier('#525252');
  static Color grey = HexColor.frontier('#737477');
  static Color lightGrey = HexColor.frontier('#9e9e9e');
  static Color primaryOpacity70 = Color.fromARGB(255, 255, 230, 162);

  static Color darkPrimary = HexColor.frontier('#d17d11');
  static Color grey1 = HexColor.frontier('#787878');
  static Color grey2 = HexColor.frontier('#797979');
  static Color white = HexColor.frontier('#ffffff');
  static Color error = HexColor.frontier('#e61f34');
}

extension HexColor on Color {
  static Color frontier(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) //true if color does not have opacity
      hexColorString = 'FF' +
          hexColorString; //FF is concatenated if color does not have opacity

    return Color(int.parse(hexColorString, radix: 16));
  }
}
