## ByteSize [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Ron4fun/byte_size/blob/master/LICENSE) [![Build Status](https://travis-ci.org/Ron4fun/byte_size.svg?branch=master)](https://travis-ci.org/Ron4fun/byte_size)

**`ByteSize`** is a null safe library written in **Dart** language that handles how byte sizes are represented and an easy to use interface to convert to other forms of representation also taking locale into consideration. While adopting the `International Electrotechnical Commission` ([IEC](https://en.wikipedia.org/wiki/Byte)) proposed standard (kibi, mebi, gibi etc.).

## Usage

A simple usage example:

```dart
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
```


### **The `toString` Function**

An empty input string `symbol` returns the largest whole number value with the unit. Also, negative precision throws the `FormatException` and if the input string `symbol` is incorrectly formatted. And, the `toString` function allows you to choose how you want your ByteSize object string to be display either using the ***Binary*** or ***Decimal*** representation.

### **All The Acceptable Input String Symbol Formats**
 
	
Here are all the acceptable input string `symbol` formats:

	"b" => Bit
	"B" => Byte 
	"KiB" => KibiByte 
	"KB" => KiloByte
	"MiB" => MebiByte 
	"MB" => MegaByte
	"GiB" => GibiByte 
	"GB" => GigaByte
	"TiB" => TebiByte
	"TB" => TeraByte
	"PiB" => PebiByte 
	"PB" => PetaByte
	"EiB" => ExbiByte
	"EB" => ExaByte
	
All symbols between parenthesis are good. Also, be careful about the 
	  case-sentivity when it comes to `b` and `B`.

License
----------
    Copyright (c) 2020 - 2022 Mbadiwe Nnaemeka Ronald ron2tele@gmail.com

    This software is provided 'as-is', without any express or implied
    warranty. In no event will the author be held liable for any damages
    arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute it
    freely, subject to the following restrictions:
    
    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation must be
    specified.
    
    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.
    
    3. This notice may not be removed or altered from any source distribution.
        
     
#### Tip Jar
* :dollar: **Bitcoin**: `1Mcci95WffSJnV6PsYG7KD1af1gDfUvLe6`


Conclusion
--------------------------------------------------

   Special thanks to [Xor-el](https://github.com/xor-el) for making this library available in the first place.
