## ByteSize [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Ron4fun/byte_size/blob/master/LICENSE) [![Build Status](https://travis-ci.org/Ron4fun/byte_size.svg?branch=master)](https://travis-ci.org/Ron4fun/byte_size)

**`ByteSize`** is a library written in **Dart** language that handles how byte sizes are represented and an easy to use interface to convert to other forms of representation also taking locale into consideration.

## Usage

A simple usage example:

```dart
import 'package:byte_size/byte_size.dart';
import 'package:locales/locales.dart';
import 'dart:convert';

void main() {
  var size = ByteSize.FromKiloBytes(10000);
    print(size.toString('MB', 3, Locale.fr_CA)); // 9,766 MB
  
    var json = JsonEncoder();
    print(json.convert(size));
    // {"b":"81920000","B":"10240000.00000000000000000000","KB":"10000.00000000000000000000",
    // "MB":"9.76562500000000000000","GB":"0.00953674316406250000","TB":"0.00000931322574615479",
    // "PB":"0.00000000909494701773"}
  
    var size2 = size.copy();
    print(size2.toString('KB')); // 10,000 KB
}
```
License
----------
    Copyright (c) 2020 Mbadiwe Nnaemeka Ronald ron2tele@gmail.com

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