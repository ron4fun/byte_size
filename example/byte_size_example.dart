import 'package:byte_size/byte_size.dart';

void main() {
  var size = ByteSize.FromKiloBytes(10000);
  print(size.toString('MB', 3, 'fr_CA')); // 9,766 MB

  var json = size.toJson();
  print(json);
  // {"b":"81920000","B":"10240000.00000000000000000000","KB":"10000.00000000000000000000",
  // "MB":"9.76562500000000000000","GB":"0.00953674316406250000","TB":"0.00000931322574615479",
  // "PB":"0.00000000909494701773"}

  var size2 = size.copy();
  print(size2.toString('KB')); // 10,000 KB

  var size3 = ByteSize.fromJson(json);
  print(size3.toString('KB')); // 10,000 KB
}
