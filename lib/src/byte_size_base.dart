/*
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

    3. This notice must not be removed or altered from any source distribution.
*/

import 'package:locales/locales.dart';
import 'package:intl/intl.dart';

class FormatException implements Exception {
  String cause;
  FormatException(this.cause);
} // end class FormatException

class ArgumentNullException implements Exception {
  String cause;
  ArgumentNullException(this.cause);
} // end class ArgumentNullException

class ByteSize {
  static const int _Int64MaxValue = 9223372036854775807;
  static const int _BitsInByte = 8;
  static const int _BytesInKiloByte = 1024;
  static const int _BytesInMegaByte = 1048576;
  static const int _BytesInGigaByte = 1073741824;
  static const int _BytesInTeraByte = 1099511627776;
  static const int _BytesInPetaByte = 1125899906842624;

  static const String _BitSymbol = 'b';
  static const String _ByteSymbol = 'B';
  static const String _KiloByteSymbol = 'KB';
  static const String _MegaByteSymbol = 'MB';
  static const String _GigaByteSymbol = 'GB';
  static const String _TeraByteSymbol = 'TB';
  static const String _PetaByteSymbol = 'PB';

  static const List<String> _NumArray = ['0','1','2','3','4','5','6','7','8','9'];
  static const List<String> _SymbolArray = ['b', 'B', 'KB', 'kB', 'kb', 'MB', 'mB',
    'mb', 'GB', 'gB', 'gb', 'TB', 'tB', 'tb', 'PB', 'pB', 'pb'];

  int _Bits;
  double _Bytes;
  double _KiloBytes;
  double _MegaBytes;
  double _GigaBytes;
  double _TeraBytes;
  double _PetaBytes;

  ByteSize({double byteSize = 0}) {
    double tempDouble = byteSize * _BitsInByte;

    // Get Truncation because bits are whole units
    _Bits = tempDouble.toInt();

    _Bytes = byteSize;
    _KiloBytes = byteSize / _BytesInKiloByte;
    _MegaBytes = byteSize / _BytesInMegaByte;
    _GigaBytes = byteSize / _BytesInGigaByte;
    _TeraBytes = byteSize / _BytesInTeraByte;
    _PetaBytes = byteSize / _BytesInPetaByte;

  } // end cctr

  int get Bits => _Bits;
  double get Bytes => _Bytes;
  double get KiloBytes => _KiloBytes;
  double get MegaBytes => _MegaBytes;
  double get GigaBytes => _GigaBytes;
  double get TeraBytes => _TeraBytes;
  double get PetaBytes => _PetaBytes;

  String _LargestWholeNumberSymbol() {
    // Absolute value is used to deal with negative values
    if (PetaBytes.abs() >= 1) {
      return _PetaByteSymbol;
    } else if (TeraBytes.abs() >= 1) {
      return _TeraByteSymbol;
    } else if (GigaBytes.abs() >= 1) {
      return _GigaByteSymbol;
    } else if (MegaBytes.abs() >= 1) {
      return _MegaByteSymbol;
    } else if (KiloBytes.abs() >= 1) {
      return _KiloByteSymbol;
    } else if (Bytes.abs() >= 1) {
      return _ByteSymbol;
    }
    return _BitSymbol;
  } // end function LargestWholeNumberSymbol

  double _LargestWholeNumberValue() {
    // Absolute value is used to deal with negative values
    if (PetaBytes.abs() >= 1) {
      return PetaBytes;
    } else if (TeraBytes.abs() >= 1) {
      return TeraBytes;
    } else if (GigaBytes.abs() >= 1) {
      return GigaBytes;
    } else if (MegaBytes.abs() >= 1) {
      return MegaBytes;
    } else if (KiloBytes.abs() >= 1) {
      return KiloBytes;
    } else if (Bytes.abs() >= 1) {
      return Bytes;
    }
    return Bits.toDouble();
  } // end function LargestWholeNumberValue

  static ByteSize FromBits(int value) {
    double dBitsInByte = _BitsInByte.toDouble();
    double tempDouble = value / dBitsInByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromBits

  static ByteSize FromBytes(double value) {
    return ByteSize(byteSize: value);
  } // end function FromBytes

  static ByteSize FromKiloBytes(double value) {
    double tempDouble = value * _BytesInKiloByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromKiloBytes

  static ByteSize FromMegaBytes(double value) {
    double tempDouble = value * _BytesInMegaByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromMegaBytes

  static ByteSize FromGigaBytes(double value) {
    double tempDouble = value * _BytesInGigaByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromGigaBytes

  static ByteSize FromTeraBytes(double value) {
    double tempDouble = value * _BytesInTeraByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromTeraBytes

  static ByteSize FromPetaBytes(double value) {
    double tempDouble = value * _BytesInPetaByte;
    return ByteSize(byteSize: tempDouble);
  } // end function FromPetaBytes

  int CompareTo(ByteSize bs)
  {
    // return an integer
    if (Bits == bs.Bits) {
      return 0;
    } else if (Bits < bs.Bits) return -1;
    return 1;
  } // end function CompareTo

  ByteSize Add(ByteSize bs)
  {
    return ByteSize(byteSize: Bytes + bs.Bytes);
  } // end function Add

  ByteSize AddBits(int value)
  {
    return this + FromBits(value);
  } // edn function AddBits

  ByteSize AddBytes(double value)
  {
    return this + FromBytes(value);
  } // end function AddBytes

  ByteSize AddKiloBytes(double value)
  {
    return this + FromKiloBytes(value);
  } // end function AddKiloBytes

  ByteSize AddMegaBytes(double value)
  {
    return this + FromMegaBytes(value);
  } // end function AddMegaBytes

  ByteSize AddGigaBytes(double value)
  {
    return this + FromGigaBytes(value);
  } // end function AddGigaBytes

  ByteSize AddTeraBytes(double value)
  {
    return this + FromTeraBytes(value);
  } // end function AddTeraBytes

  ByteSize AddPetaBytes(double value)
  {
    return this + FromPetaBytes(value);
  } // end function AddPetaBytes

  ByteSize Subtract(ByteSize bs)
  {
    return ByteSize(byteSize: Bytes - bs.Bytes);
  } // end function Subtract

  bool operator<(ByteSize bs)
  {
    return Bits < bs.Bits;
  }

  bool operator<=(ByteSize bs)
  {
    return Bits <= bs.Bits;
  }

  bool operator>(ByteSize bs)
  {
    return Bits > bs.Bits;
  }

  bool operator>=(ByteSize bs)
  {
    return Bits >= bs.Bits;
  }

  @override
  bool operator==(dynamic bs)
  {
    if (bs is ByteSize) return Bits == bs.Bits;
    return false;
  }

  ByteSize operator+(ByteSize bs)
  {
    return Add(bs);
  }

  ByteSize operator-(ByteSize bs)
  {
    return Subtract(bs);
  }

  String ToString({symbol = 'KB', precision = 2, locale_LANG=Locale.en_US})
  {
    symbol = _StripAllWhiteSpace(symbol);

    if (symbol.contains('PB')) {
      return '${_output(PetaBytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains('TB')) {
      return '${_output(TeraBytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains('GB')) {
      return '${_output(GigaBytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains('MB')) {
      return '${_output(MegaBytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains('KB')) {
      return '${_output(KiloBytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains(_ByteSymbol)) {
      return '${_output(Bytes, precision, locale_LANG)} $symbol';
    } else if (symbol.contains(_BitSymbol)) return '${_output(Bits.toDouble(), precision, locale_LANG)} $symbol';

    return '${_output(_LargestWholeNumberValue(), precision, locale_LANG)} ${_LargestWholeNumberSymbol()}';
  } // end function ToString

  static String _output(double digits, int precision, locale)
  {
    try {
      var format = NumberFormat.decimalPattern('$locale');
      // Added 1 to precision because of locale format function behaviour
      return format.format(double.parse(digits.toStringAsPrecision(precision + 1)));
    } on Exception {
      throw FormatException('locale language not in the correct format');
    }
  } // end function _output

  static String _StripAllWhiteSpace(String txt)
  {
    if (txt == null) return '';

    String temp = '';
    txt = txt.trim();

    for (int i = 0; i < txt.length; i++) {
      String e = txt[i];
      if (e == ' ') continue;
      temp = temp + e;
    } // end for

    return temp;
  } // end function StripAllWhiteSpace

  static double _FloatingMod(double a, double b)
  {
    double tempDouble = a / b;
    return a - b * tempDouble.toInt();
  } // end function _FloatingMod

  static bool _IsNullOrWhiteSpace(String txt) => txt == null ? true : txt.trim().isEmpty;

  static ByteSize GetMinValue() => FromBits(0);

  static ByteSize GetMaxValue() => FromBits(_Int64MaxValue);

  static ParseOutput TryParse(String value) {
    // Return a Boolean and a ByteSize object
    // Arg checking
    if (_IsNullOrWhiteSpace(value)) {
      throw ArgumentNullException('Input String is null or whitespace');
    }

    // Get the index of the first non-digit character
    String tempS = _StripAllWhiteSpace(value); // Protect against leading spaces
    bool found = false;

    // Pick first non-digit number
    int num = 1;
    for (int i = 0; i < tempS.length; i++)
    {
      String c = tempS[i];
      if (!(_NumArray.contains(c) || c == '.'))
      {
        found = true;
        break;
      }

      num += 1;
    } // end for

    if (found == false) {
      return ParseOutput(true, ByteSize());
    }

    int lastNumber = num - 1;

    // Cut the input string in half
    String numberPart = tempS.substring(0, lastNumber).trim();
    String sizePart   = tempS.substring(lastNumber).trim();

    // Get the numeric part
    double number;
    try {
      number = double.parse(numberPart);
    } on Exception {
      return ParseOutput(true, ByteSize());
    }

    // Get the magnitude part
    int tempInt;
    try {
      tempInt = _SymbolArray.indexOf(sizePart);
    } on Exception {
      return ParseOutput(true, ByteSize());
    }

    if (tempInt == 0)
    {
      double d1 = 1 * 1.0;
      if (_FloatingMod(number, d1) != 0) {
        // Can't have partial bits
        return ParseOutput(true, ByteSize());
      }

      return ParseOutput(false, ByteSize.FromBits(number.toInt()));
    }

    if (tempInt == 1) {
      return ParseOutput(false, ByteSize.FromBytes(number));
    }
    if ([2,3,4].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromKiloBytes(number));
    }
    if ([5,6,7].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromMegaBytes(number));
    }
    if ([8,9,10].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromGigaBytes(number));
    }
    if ([11,12,13].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromTeraBytes(number));
    }
    if ([14,15,16].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromPetaBytes(number));
    }
    return ParseOutput(true, ByteSize());
  } // end function TryParse

  static ByteSize Parse(String value)
  {
    ParseOutput output = TryParse(value);
    if (output.IsExceptionThrown == true) {
      throw FormatException('Value is not in the correct format');
    }
    return output.ByteSizeObj;
  } // end function Parse

} // end class ByteSize

class ParseOutput {
  final ByteSize ByteSizeObj;
  final bool IsExceptionThrown;

  ParseOutput(this.IsExceptionThrown, this.ByteSizeObj);
} // end class ParseOutput