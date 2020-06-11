import 'package:byte_size/byte_size.dart';
import 'package:locales/locales.dart';

void main() {
  var size = ByteSize.FromKiloBytes(10000);
  print(size.ToString(symbol: 'MB', precision: 1, locale_LANG: Locale.fr_CA));
}
