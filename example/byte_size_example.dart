import 'package:byte_size/byte_size.dart';
import 'package:locales/locales.dart';

void main() {
  var size = ByteSize.FromKiloBytes(10000);
  print(size.ToString('MB', 3, Locale.fr_CA)); // 9,766 MB
}
