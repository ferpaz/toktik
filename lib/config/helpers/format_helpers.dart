import 'package:intl/intl.dart';

class FormatHelpers {
  static String hummanReadableNumber(double number) {
    final formater = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    );
    return formater.format(number);
  }
}