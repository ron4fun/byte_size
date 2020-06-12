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
import 'dart:core';

/// This exception indicates that there exist an issue with the argument passed.
class FormatException implements Exception {
  String cause;
  FormatException(this.cause);
} // end class FormatException

/// This exception indicates that the argument passed is null.
class ArgumentNullException implements Exception {
  String cause;
  ArgumentNullException(this.cause);
} // end class ArgumentNullException

/// ByteSize handles how byte sizes are represented.
///
/// ```dart
/// var size = new ByteSize(1024);
/// ```
class ByteSize implements Comparable {
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

  static const List<String> _NumArray = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];
  static const List<String> _SymbolArray = [
    'b',
    'B',
    'KB',
    'kB',
    'kb',
    'MB',
    'mB',
    'mb',
    'GB',
    'gB',
    'gb',
    'TB',
    'tB',
    'tb',
    'PB',
    'pB',
    'pb'
  ];

  int _Bits;
  num _Bytes;
  num _KiloBytes;
  num _MegaBytes;
  num _GigaBytes;
  num _TeraBytes;
  num _PetaBytes;

  /// Initialize class with the size in Bytes denoted by [byteSize].
  ///
  /// ```dart
  /// var size = new ByteSize(1024);
  /// ```
  ByteSize([num byteSize = 0]) {
    double tempDouble = byteSize * _BitsInByte.toDouble();

    // Get Truncation because bits are whole units
    _Bits = tempDouble.toInt();

    _Bytes = byteSize;
    _KiloBytes = byteSize / _BytesInKiloByte;
    _MegaBytes = byteSize / _BytesInMegaByte;
    _GigaBytes = byteSize / _BytesInGigaByte;
    _TeraBytes = byteSize / _BytesInTeraByte;
    _PetaBytes = byteSize / _BytesInPetaByte;
  } // end constructor

  /// Returns the size in Bits
  int get Bits => _Bits;

  /// Returns the size in Bytes
  num get Bytes => _Bytes;

  /// Returns the size in KiloBytes
  num get KiloBytes => _KiloBytes;

  /// Returns the size in MegaBytes
  num get MegaBytes => _MegaBytes;

  /// Returns the size in GigaBytes
  num get GigaBytes => _GigaBytes;

  /// Returns the size in TeraBytes
  num get TeraBytes => _TeraBytes;

  /// Returns the size in PetaBytes
  num get PetaBytes => _PetaBytes;

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

  num _LargestWholeNumberValue() {
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
    return Bits;
  } // end function LargestWholeNumberValue

  /// Returns a ByteSize object initialized by size in Bits.
  ///
  /// ```dart
  /// var size = ByteSize.FromBits(10000);
  /// ```
  static ByteSize FromBits(int value) =>
      ByteSize(value / _BitsInByte); // end function FromBits

  /// Returns a ByteSize object initialized by size in Bytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromBytes(1024);
  /// ```
  static ByteSize FromBytes(num value) =>
      ByteSize(value); // end function FromBytes

  /// Returns a ByteSize object initialized by size in KiloBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromKiloBytes(10);
  /// ```
  static ByteSize FromKiloBytes(num value) =>
      ByteSize(value * _BytesInKiloByte); // end function FromKiloBytes

  /// Returns a ByteSize object initialized by size in MegaBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromMegaBytes(10);
  /// ```
  static ByteSize FromMegaBytes(num value) =>
      ByteSize(value * _BytesInMegaByte); // end function FromMegaBytes

  /// Returns a ByteSize object initialized by size in GigaBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromGigaBytes(10);
  /// ```
  static ByteSize FromGigaBytes(num value) =>
      ByteSize(value * _BytesInGigaByte); // end function FromGigaBytes

  /// Returns a ByteSize object initialized by size in TeraBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromTeraBytes(10);
  /// ```
  static ByteSize FromTeraBytes(num value) =>
      ByteSize(value * _BytesInTeraByte); // end function FromTeraBytes

  /// Returns a ByteSize object initialized by size in PetaBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromPetaBytes(10);
  /// ```
  static ByteSize FromPetaBytes(num value) =>
      ByteSize(value * _BytesInPetaByte); // end function FromPetaBytes

  /// Returns -1, 0 or 1 when passed another ByteSize object.
  ///
  /// ```dart
  /// ByteSize(1024).compareTo(ByteSize.FromBytes(1024)); // 0;
  /// ```
  @override
  int compareTo(dynamic bs) =>
      Bits.compareTo(bs.Bits); // end function compareTo

  /// Returns the sum of two ByteSize objects.
  ByteSize Add(ByteSize bs) => ByteSize(Bytes + bs.Bytes); // end function Add

  /// Returns the sum of size in Bits and current ByteSize instance.
  ByteSize AddBits(int value) => this + FromBits(value); // end function AddBits

  /// Returns the sum of size in Bytes and current ByteSize instance.
  ByteSize AddBytes(num value) =>
      this + FromBytes(value); // end function AddBytes

  /// Returns the sum of size in KiloBytes and current ByteSize instance.
  ByteSize AddKiloBytes(num value) =>
      this + FromKiloBytes(value); // end function AddKiloBytes

  /// Returns the sum of size in MegaBytes and current ByteSize instance.
  ByteSize AddMegaBytes(num value) =>
      this + FromMegaBytes(value); // end function AddMegaBytes

  /// Returns the sum of size in GigaBytes and current ByteSize instance.
  ByteSize AddGigaBytes(num value) =>
      this + FromGigaBytes(value); // end function AddGigaBytes

  /// Returns the sum of size in TeraBytes and current ByteSize instance.
  ByteSize AddTeraBytes(num value) =>
      this + FromTeraBytes(value); // end function AddTeraBytes

  /// Returns the sum of size in PetaBytes and current ByteSize instance.
  ByteSize AddPetaBytes(num value) =>
      this + FromPetaBytes(value); // end function AddPetaBytes

  /// Returns the difference of two ByteSize objects.
  ByteSize Subtract(ByteSize bs) =>
      ByteSize(Bytes - bs.Bytes); // end function Subtract

  /// Returns if current ByteSize instance is less than another.
  bool operator <(ByteSize bs) => Bits < bs.Bits;

  /// Returns if current ByteSize instance is less than or equals another.
  bool operator <=(ByteSize bs) => Bits <= bs.Bits;

  /// Returns if current ByteSize instance is greater than another.
  bool operator >(ByteSize bs) => Bits > bs.Bits;

  /// Returns if current ByteSize instance is greater than or equals another.
  bool operator >=(ByteSize bs) => Bits >= bs.Bits;

  /// Returns if current ByteSize instance is equal to another.
  @override
  bool operator ==(dynamic bs) {
    if (bs is ByteSize) return Bits == bs.Bits;
    return false;
  }

  /// Returns the sum of two ByteSize objects.
  ByteSize operator +(ByteSize bs) => Add(bs);

  /// Returns the difference of two ByteSize objects.
  ByteSize operator -(ByteSize bs) => Subtract(bs);

  /// Returns the string representation of the ByteSize instance
  /// i.e passing the [symbol], [precision] and or [locale_LANG] as arguments.
  ///
  /// ```dart
  /// var size = ByteSize.FromKiloBytes(10000);
  /// print(size.ToString('MB', 1, Locale.fr_CA)); // 9,8 MB
  /// ```
  String ToString(
      [String symbol = 'KB',
      int precision = 2,
      Locale locale_LANG = Locale.en_US]) {
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
    } else if (symbol.contains(_BitSymbol)) {
      return '${_output(Bits.toDouble(), precision, locale_LANG)} $symbol';
    }
    return '${_output(_LargestWholeNumberValue(), precision, locale_LANG)} ${_LargestWholeNumberSymbol()}';
  } // end function ToString

  static String _output(num digits, int precision, locale) {
    try {
      var format = NumberFormat.decimalPattern('$locale');
      return format.format(double.parse(digits.toStringAsFixed(precision)));
    } on Exception {
      throw FormatException('locale language not in the correct format');
    }
  } // end function _output

  static String _StripAllWhiteSpace(String txt) {
    if (txt == null || txt.isEmpty) return '';

    String c, temp = '';
    txt = txt.trim();

    for (int i = 0; i < txt.length; i++) {
      c = txt[i];
      if (c == ' ') continue;
      temp = temp + c;
    } // end for

    return temp;
  } // end function StripAllWhiteSpace

  static double _FloatingMod(double a, double b) =>
      a - b * (a ~/ b); // end function _FloatingMod

  static bool _IsNullOrWhiteSpace(String txt) =>
      txt == null ? true : txt.trim().isEmpty;

  /// Returns the minimum possible ByteSize objects.
  static ByteSize GetMinValue() => FromBits(0);

  /// Returns the maximum possible ByteSize objects.
  static ByteSize GetMaxValue() => FromBits(_Int64MaxValue);

  /// Returns a ParseOutput object by parsing a string value.
  ///
  /// ```dart
  /// ParseOutput output = ByteSize.TryParse('1024MB');
  /// output.ByteSizeObj == ByteSize.FromMegaBytes(1024);
  /// ```
  static ParseOutput TryParse(String value) {
    // Return a Boolean and a ByteSize object
    // Arg checking
    if (_IsNullOrWhiteSpace(value)) {
      throw ArgumentNullException('Input String is null or whitespace');
    }

    // Get the index of the first non-digit character
    String c,
        tempS = _StripAllWhiteSpace(value); // Protect against leading spaces
    bool found = false;

    // Pick first non-digit number
    int num = 1;
    for (int i = 0; i < tempS.length; i++) {
      c = tempS[i];
      if (!(_NumArray.contains(c) || c == '.')) {
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
    String sizePart = tempS.substring(lastNumber).trim();

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

    if (tempInt == 0) {
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
    if ([2, 3, 4].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromKiloBytes(number));
    }
    if ([5, 6, 7].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromMegaBytes(number));
    }
    if ([8, 9, 10].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromGigaBytes(number));
    }
    if ([11, 12, 13].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromTeraBytes(number));
    }
    if ([14, 15, 16].contains(tempInt)) {
      return ParseOutput(false, ByteSize.FromPetaBytes(number));
    }
    return ParseOutput(true, ByteSize());
  } // end function TryParse

  /// Returns a ByteSize object by parsing a string value and
  /// throws an exception if argument is incorrectly formatted.
  ///
  /// ```dart
  /// ByteSize.Parse('1024MB') == ByteSize.FromMegaBytes(1024);
  /// ```
  static ByteSize Parse(String value) {
    ParseOutput output = TryParse(value);
    if (output.IsExceptionThrown == true) {
      throw FormatException('Value is not in the correct format');
    }
    return output.ByteSizeObj;
  } // end function Parse

} // end class ByteSize

/// It is the object returned by the TryParse static method of ByteSize class.
class ParseOutput {
  /// It is the ByteSize object that is returned.
  final ByteSize ByteSizeObj;

  /// It denotes whether an exception was hit when parsing the argument.
  final bool IsExceptionThrown;

  ParseOutput(this.IsExceptionThrown, this.ByteSizeObj);
} // end class ParseOutput
