import 'package:byte_size/byte_size.dart';

void main() {
  var size = ByteSize.FromKibiBytes(10000);
  print(size.toString('MiB', 3, 'fr_CA')); // 9,766 MiB

  var json = size.toJson();
  print(json);
  // {b: 81920000, B: 10240000.000000000, KiB: 10000.000000000, 
  // MiB: 9.765625000, GiB: 0.009536743, TiB: 0.000009313, PiB: 0.000000009, 
  // KB: 10240.000000000, MB: 10.240000000, GB: 0.010240000, 
  // TB: 0.000010240, PB: 0.000000010}

  var size2 = size.copy();
  print(size2.toString('KiB', 0)); // 10,000 KiB

  var size3 = ByteSize.fromJson(json);
  print(size3.toString()); // 9.77 MiB
  print(size3.toString('', 2, 'en_US', true, false)); // 10.24 MB
}
