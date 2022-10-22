// ignore_for_file: unnecessary_null_comparison

/*
Copyright (c) 2020 -2022 Mbadiwe Nnaemeka Ronald ron2tele@gmail.com

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

import 'dart:core';

import 'package:intl/intl.dart';

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
  static const int _BytesInKibiByte = 1024;
  static const int _BytesInMebiByte = 1048576;
  static const int _BytesInGibiByte = 1073741824;
  static const int _BytesInTebiByte = 1099511627776;
  static const int _BytesInPebiByte = 1125899906842624;

  static const int _BytesInKiloByte = 1000;
  static const int _BytesInMegaByte = 1000000;
  static const int _BytesInGigaByte = 1000000000;
  static const int _BytesInTeraByte = 1000000000000;
  static const int _BytesInPetaByte = 1000000000000000;

  static const String _BitSymbol = 'b';
  static const String _ByteSymbol = 'B';
  static const String _KibiByteSymbol = 'KiB';
  static const String _MebiByteSymbol = 'MiB';
  static const String _GibiByteSymbol = 'GiB';
  static const String _TebiByteSymbol = 'TiB';
  static const String _PebiByteSymbol = 'PiB';

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
    'KiB',
    'KB',
    'MiB',
    'MB',
    'GiB',
    'GB',
    'TiB',
    'TB',
    'PiB',
    'PB'
  ];

  late int _Bits;
  late num _Bytes;
  late num _KibiBytes;
  late num _MebiBytes;
  late num _GibiBytes;
  late num _TebiBytes;
  late num _PebiBytes;

  late num _KiloBytes;
  late num _MegaBytes;
  late num _GigaBytes;
  late num _TeraBytes;
  late num _PetaBytes;

  /// Initialize class with the size in Bytes denoted by [byteSize].
  ///
  /// ```dart
  /// var size = new ByteSize(1024);
  /// ```
  ByteSize([num byteSize = 0]) {
    var tempDouble = byteSize * _BitsInByte.toDouble();

    // Get Truncation because bits are whole units
    _Bits = tempDouble.toInt();

    _Bytes = byteSize;
    _KibiBytes = byteSize / _BytesInKibiByte;
    _MebiBytes = byteSize / _BytesInMebiByte;
    _GibiBytes = byteSize / _BytesInGibiByte;
    _TebiBytes = byteSize / _BytesInTebiByte;
    _PebiBytes = byteSize / _BytesInPebiByte;

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

  /// Returns the size in KibiBytes
  num get KibiBytes => _KibiBytes;

  /// Returns the size in KiloBytes
  num get KiloBytes => _KiloBytes;

  /// Returns the size in MebiBytes
  num get MebiBytes => _MebiBytes;

  /// Returns the size in MegaBytes
  num get MegaBytes => _MegaBytes;

  /// Returns the size in GibiBytes
  num get GibiBytes => _GibiBytes;

  /// Returns the size in GigaBytes
  num get GigaBytes => _GigaBytes;

  /// Returns the size in TebiBytes
  num get TebiBytes => _TebiBytes;

  /// Returns the size in TeraBytes
  num get TeraBytes => _TeraBytes;

  /// Returns the size in PebiBytes
  num get PebiBytes => _PebiBytes;

  /// Returns the size in PetaBytes
  num get PetaBytes => _PetaBytes;

  String _largestWholeNumberSymbol(
      [bool check_repr = false, bool binary_format = true]) {
    if (check_repr) {
      if (binary_format) {
        if (PebiBytes.abs() >= 1) {
          return _PebiByteSymbol;
        } else if (TebiBytes.abs() >= 1) {
          return _TebiByteSymbol;
        } else if (GibiBytes.abs() >= 1) {
          return _GibiByteSymbol;
        } else if (MebiBytes.abs() >= 1) {
          return _MebiByteSymbol;
        } else if (KibiBytes.abs() >= 1) {
          return _KibiByteSymbol;
        }
      } else {
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
        }
      }
    } else {
      // Absolute value is used to deal with negative values
      if (PebiBytes.abs() >= 1) {
        return _PebiByteSymbol;
      } else if (PetaBytes.abs() >= 1) {
        return _PetaByteSymbol;
      } else if (TebiBytes.abs() >= 1) {
        return _TebiByteSymbol;
      } else if (TeraBytes.abs() >= 1) {
        return _TeraByteSymbol;
      } else if (GibiBytes.abs() >= 1) {
        return _GibiByteSymbol;
      } else if (GigaBytes.abs() >= 1) {
        return _GigaByteSymbol;
      } else if (MebiBytes.abs() >= 1) {
        return _MebiByteSymbol;
      } else if (MegaBytes.abs() >= 1) {
        return _MegaByteSymbol;
      } else if (KibiBytes.abs() >= 1) {
        return _KibiByteSymbol;
      } else if (KiloBytes.abs() >= 1) {
        return _KiloByteSymbol;
      }
    }

    if (Bytes.abs() >= 1) {
      return _ByteSymbol;
    }
    return _BitSymbol;
  } // end function largestWholeNumberSymbol

  num _largestWholeNumberValue(
      [bool check_repr = false, bool binary_format = true]) {
    if (check_repr) {
      if (binary_format) {
        if (PebiBytes.abs() >= 1) {
          return PebiBytes;
        } else if (TebiBytes.abs() >= 1) {
          return TebiBytes;
        } else if (GibiBytes.abs() >= 1) {
          return GibiBytes;
        } else if (MebiBytes.abs() >= 1) {
          return MebiBytes;
        } else if (KibiBytes.abs() >= 1) {
          return KibiBytes;
        }
      } else {
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
        }
      }
    } else {
      // Absolute value is used to deal with negative values
      if (PebiBytes.abs() >= 1) {
        return PebiBytes;
      } else if (PetaBytes.abs() >= 1) {
        return PetaBytes;
      } else if (TebiBytes.abs() >= 1) {
        return TebiBytes;
      } else if (TeraBytes.abs() >= 1) {
        return TeraBytes;
      } else if (GibiBytes.abs() >= 1) {
        return GibiBytes;
      } else if (GigaBytes.abs() >= 1) {
        return GigaBytes;
      } else if (MebiBytes.abs() >= 1) {
        return MebiBytes;
      } else if (MegaBytes.abs() >= 1) {
        return MegaBytes;
      } else if (KibiBytes.abs() >= 1) {
        return KibiBytes;
      } else if (KiloBytes.abs() >= 1) {
        return KiloBytes;
      }
    }

    if (Bytes.abs() >= 1) {
      return Bytes;
    }
    return Bits;
  } // end function largestWholeNumberValue

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

  /// Returns a ByteSize object initialized by size in KibiBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromKibiBytes(10);
  /// ```
  static ByteSize FromKibiBytes(num value) =>
      ByteSize(value * _BytesInKibiByte); // end function FromKibiBytes

  /// Returns a ByteSize object initialized by size in KiloBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromKiloBytes(10);
  /// ```
  static ByteSize FromKiloBytes(num value) =>
      ByteSize(value * _BytesInKiloByte); // end function FromKiloBytes

  /// Returns a ByteSize object initialized by size in MebiBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromMebiBytes(10);
  /// ```
  static ByteSize FromMebiBytes(num value) =>
      ByteSize(value * _BytesInMebiByte); // end function FromMebiBytes

  /// Returns a ByteSize object initialized by size in MegaBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromMegaBytes(10);
  /// ```
  static ByteSize FromMegaBytes(num value) =>
      ByteSize(value * _BytesInMegaByte); // end function FromMegaBytes

  /// Returns a ByteSize object initialized by size in GibiBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromGibiBytes(10);
  /// ```
  static ByteSize FromGibiBytes(num value) =>
      ByteSize(value * _BytesInGibiByte); // end function FromGibiBytes

  /// Returns a ByteSize object initialized by size in GigaBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromGigaBytes(10);
  /// ```
  static ByteSize FromGigaBytes(num value) =>
      ByteSize(value * _BytesInGigaByte); // end function FromGigaBytes

  /// Returns a ByteSize object initialized by size in TebiBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromTebiBytes(10);
  /// ```
  static ByteSize FromTebiBytes(num value) =>
      ByteSize(value * _BytesInTebiByte); // end function FromTebiBytes

  /// Returns a ByteSize object initialized by size in TeraBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromTeraBytes(10);
  /// ```
  static ByteSize FromTeraBytes(num value) =>
      ByteSize(value * _BytesInTeraByte); // end function FromTeraBytes

  /// Returns a ByteSize object initialized by size in PebiBytes.
  ///
  /// ```dart
  /// var size = ByteSize.FromPebiBytes(10);
  /// ```
  static ByteSize FromPebiBytes(num value) =>
      ByteSize(value * _BytesInPebiByte); // end function FromPebiBytes

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

  /// Returns an exact copy of the ByteSize object
  ByteSize copy() => ByteSize(_Bytes); // end function copy

  void _clone(ByteSize? bs) {
    if (bs == null) {
      throw ArgumentNullException('Null object passed');
    }

    _Bits = bs.Bits;
    _Bytes = bs.Bytes;
    _KibiBytes = bs.KibiBytes;
    _MebiBytes = bs.MebiBytes;
    _GibiBytes = bs.GibiBytes;
    _TebiBytes = bs.TebiBytes;
    _PebiBytes = bs.PebiBytes;

    _KiloBytes = bs.KiloBytes;
    _MegaBytes = bs.MegaBytes;
    _GigaBytes = bs.GigaBytes;
    _TeraBytes = bs.TeraBytes;
    _PetaBytes = bs.PetaBytes;
  } // end function _clone

  /// Converts ByteSize object to JSON object
  Map<String, Object> toJson() {
    var entityMap = <String, Object>{};
    entityMap[_BitSymbol] = Bits.toString();
    entityMap[_ByteSymbol] = Bytes.toStringAsFixed(20);
    entityMap[_KibiByteSymbol] = KibiBytes.toStringAsFixed(20);
    entityMap[_MebiByteSymbol] = MebiBytes.toStringAsFixed(20);
    entityMap[_GibiByteSymbol] = GibiBytes.toStringAsFixed(20);
    entityMap[_TebiByteSymbol] = TebiBytes.toStringAsFixed(20);
    entityMap[_PebiByteSymbol] = PebiBytes.toStringAsFixed(20);

    entityMap[_KiloByteSymbol] = KiloBytes.toStringAsFixed(20);
    entityMap[_MegaByteSymbol] = MegaBytes.toStringAsFixed(20);
    entityMap[_GigaByteSymbol] = GigaBytes.toStringAsFixed(20);
    entityMap[_TeraByteSymbol] = TeraBytes.toStringAsFixed(20);
    entityMap[_PetaByteSymbol] = PetaBytes.toStringAsFixed(20);
    return entityMap;
  } // end function toJson

  /// Initialize ByteSize object from JSON object
  /// according to order of precedence i.e from 'b' -> 'PiB',
  /// where 'b' has higher precedence to 'KiB' and 'KiB' has higher
  /// precedence to 'KB' and so on.
  ByteSize.fromJson(Map<String, Object> entityMap) {
    ByteSize bs;

    try {
      if (entityMap.containsKey(_BitSymbol)) {
        bs = FromBits(entityMap[_BitSymbol] is String
            ? int.parse(entityMap[_BitSymbol] as String)
            : entityMap[_BitSymbol] as int);
      } else if (entityMap.containsKey(_ByteSymbol)) {
        bs = FromBytes(entityMap[_ByteSymbol] is String
            ? num.parse(entityMap[_ByteSymbol] as String)
            : entityMap[_ByteSymbol] as int);
      } else if (entityMap.containsKey(_KibiByteSymbol)) {
        bs = FromKibiBytes(entityMap[_KibiByteSymbol] is String
            ? num.parse(entityMap[_KibiByteSymbol] as String)
            : entityMap[_KibiByteSymbol] as int);
      } else if (entityMap.containsKey(_KiloByteSymbol)) {
        bs = FromKiloBytes(entityMap[_KiloByteSymbol] is String
            ? num.parse(entityMap[_KiloByteSymbol] as String)
            : entityMap[_KiloByteSymbol] as int);
      } else if (entityMap.containsKey(_MebiByteSymbol)) {
        bs = FromMebiBytes(entityMap[_MebiByteSymbol] is String
            ? num.parse(entityMap[_MebiByteSymbol] as String)
            : entityMap[_MebiByteSymbol] as int);
      } else if (entityMap.containsKey(_MegaByteSymbol)) {
        bs = FromMegaBytes(entityMap[_MegaByteSymbol] is String
            ? num.parse(entityMap[_MegaByteSymbol] as String)
            : entityMap[_MegaByteSymbol] as int);
      } else if (entityMap.containsKey(_GibiByteSymbol)) {
        bs = FromGibiBytes(entityMap[_GibiByteSymbol] is String
            ? num.parse(entityMap[_GibiByteSymbol] as String)
            : entityMap[_GibiByteSymbol] as int);
      } else if (entityMap.containsKey(_GigaByteSymbol)) {
        bs = FromGigaBytes(entityMap[_GigaByteSymbol] is String
            ? num.parse(entityMap[_GigaByteSymbol] as String)
            : entityMap[_GigaByteSymbol] as int);
      } else if (entityMap.containsKey(_TebiByteSymbol)) {
        bs = FromTebiBytes(entityMap[_TebiByteSymbol] is String
            ? num.parse(entityMap[_TebiByteSymbol] as String)
            : entityMap[_TebiByteSymbol] as int);
      } else if (entityMap.containsKey(_TeraByteSymbol)) {
        bs = FromTeraBytes(entityMap[_TeraByteSymbol] is String
            ? num.parse(entityMap[_TeraByteSymbol] as String)
            : entityMap[_TeraByteSymbol] as int);
      } else if (entityMap.containsKey(_PebiByteSymbol)) {
        bs = FromPebiBytes(entityMap[_PebiByteSymbol] is String
            ? num.parse(entityMap[_PebiByteSymbol] as String)
            : entityMap[_PebiByteSymbol] as int);
      } else if (entityMap.containsKey(_PetaByteSymbol)) {
        bs = FromPetaBytes(entityMap[_PetaByteSymbol] is String
            ? num.parse(entityMap[_PetaByteSymbol] as String)
            : entityMap[_PetaByteSymbol] as int);
      } else {
        throw Exception;
      }

      _clone(bs);
    } on Exception {
      throw FormatException('Json object not in correct format');
    }
  } // end function fromJson

  /// Returns the sum of two ByteSize objects.
  ByteSize add(ByteSize bs) => ByteSize(Bytes + bs.Bytes); // end function add

  /// Returns the sum of size in Bits and current ByteSize instance.
  ByteSize addBits(int value) => this + FromBits(value); // end function addBits

  /// Returns the sum of size in Bytes and current ByteSize instance.
  ByteSize addBytes(num value) =>
      this + FromBytes(value); // end function addBytes

  /// Returns the sum of size in KibiBytes and current ByteSize instance.
  ByteSize addKibiBytes(num value) =>
      this + FromKibiBytes(value); // end function addKibiBytes

  /// Returns the sum of size in KiloBytes and current ByteSize instance.
  ByteSize addKiloBytes(num value) =>
      this + FromKiloBytes(value); // end function addKiloBytes

  /// Returns the sum of size in MebiBytes and current ByteSize instance.
  ByteSize addMebiBytes(num value) =>
      this + FromMebiBytes(value); // end function addMebiBytes

  /// Returns the sum of size in MegaBytes and current ByteSize instance.
  ByteSize addMegaBytes(num value) =>
      this + FromMegaBytes(value); // end function addMegaBytes

  /// Returns the sum of size in GibiBytes and current ByteSize instance.
  ByteSize addGibiBytes(num value) =>
      this + FromGibiBytes(value); // end function addGibiBytes

  /// Returns the sum of size in GigaBytes and current ByteSize instance.
  ByteSize addGigaBytes(num value) =>
      this + FromGigaBytes(value); // end function addGigaBytes

  /// Returns the sum of size in TebiBytes and current ByteSize instance.
  ByteSize addTebiBytes(num value) =>
      this + FromTebiBytes(value); // end function addTebiBytes

  /// Returns the sum of size in TeraBytes and current ByteSize instance.
  ByteSize addTeraBytes(num value) =>
      this + FromTeraBytes(value); // end function addTeraBytes

  /// Returns the sum of size in PebiBytes and current ByteSize instance.
  ByteSize addPebiBytes(num value) =>
      this + FromPebiBytes(value); // end function addPebiBytes

  /// Returns the sum of size in PetaBytes and current ByteSize instance.
  ByteSize addPetaBytes(num value) =>
      this + FromPetaBytes(value); // end function addPetaBytes

  /// Returns the difference of two ByteSize objects.
  ByteSize subtract(ByteSize bs) =>
      ByteSize(Bytes - bs.Bytes); // end function subtract

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
  ByteSize operator +(ByteSize bs) => add(bs);

  /// Returns the difference of two ByteSize objects.
  ByteSize operator -(ByteSize bs) => subtract(bs);

  /// Returns the string representation of the ByteSize instance
  /// i.e passing the [symbol], [precision], [locale_LANG], [check_repr] and or [binary_format] as arguments.
  ///
  /// ```dart
  /// var size = ByteSize.FromKibiBytes(10000);
  /// print(size.ToString('MiB', 1, Locale.fr_CA)); // 9,8 MiB
  /// ```
  @override
  String toString(
      [String symbol = '',
      int precision = 2,
      String locale_LANG = 'en_US',
      bool check_repr = false,
      bool binary_format = true]) {

    if (precision < 0) throw FormatException('Precision cannot be negative');

    symbol = symbol.replaceAll(' ', '');

    if (symbol.isEmpty) {
      return '${_Output(_largestWholeNumberValue(check_repr, binary_format), precision, locale_LANG)} ${_largestWholeNumberSymbol(check_repr, binary_format)}';
    }

    if (symbol.length != 1) {
      if (_EqualsIgnoreCase(symbol, 'PiB')) {
        return '${_Output(PebiBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'PB')) {
        return '${_Output(PetaBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'TiB')) {
        return '${_Output(TebiBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'TB')) {
        return '${_Output(TeraBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'GiB')) {
        return '${_Output(GibiBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'GB')) {
        return '${_Output(GigaBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'MiB')) {
        return '${_Output(MebiBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'MB')) {
        return '${_Output(MegaBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'KiB')) {
        return '${_Output(KibiBytes, precision, locale_LANG)} $symbol';
      } else if (_EqualsIgnoreCase(symbol, 'KB')) {
        return '${_Output(KiloBytes, precision, locale_LANG)} $symbol';
      }
    } else {
      if (symbol == _ByteSymbol) {
        return '${_Output(Bytes, precision, locale_LANG)} $symbol';
      } else if (symbol == _BitSymbol) {
        return '${_Output(Bits.toDouble(), precision, locale_LANG)} $symbol';
      }
    }
    throw FormatException('Symbol is not in the correct format');
  } // end function toString

  static bool _EqualsIgnoreCase(String a, String b) =>
      a.toLowerCase() == b.toLowerCase();

  static String _Output(num digits, int precision, locale) {
    try {
      var format = NumberFormat.decimalPattern(locale);
      return format.format(double.parse(digits.toStringAsFixed(precision)));
    } on Exception {
      throw FormatException('locale language not in the correct format');
    }
  } // end function _Output

  static double _FloatingMod(double a, double b) =>
      a - b * (a ~/ b); // end function _FloatingMod

  static bool _IsNullOrWhiteSpace(String txt) => txt.trim().isEmpty;

  /// Returns the minimum possible ByteSize objects.
  static ByteSize GetMinValue() => FromBits(0);

  /// Returns the maximum possible ByteSize objects.
  static ByteSize GetMaxValue() => FromBits(_Int64MaxValue);

  /// Returns a ParseOutput object by parsing a string value.
  ///
  /// ```dart
  /// ParseOutput output = ByteSize.TryParse('1024MiB');
  /// output.ByteSizeObj == ByteSize.FromMebiBytes(1024);
  /// ```
  static ParseOutput TryParse(String value) {
    // Return a Boolean and a ByteSize object
    // Arg checking
    if (_IsNullOrWhiteSpace(value)) {
      throw ArgumentNullException('Input String is null or whitespace');
    }

    // Get the index of the first non-digit character
    String c, tempS = value.replaceAll(' ', ''); // Protect against whitespaces
    var found = false;

    // Pick first non-digit number
    var num = 1;
    for (var i = 0; i < tempS.length; i++) {
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

    var lastNumber = num - 1;

    // Cut the input string in half
    var numberPart = tempS.substring(0, lastNumber).trim();
    var sizePart = tempS.substring(lastNumber).trim();

    // Get the numeric part
    double number;
    try {
      number = double.parse(numberPart);
    } on Exception {
      return ParseOutput(true, ByteSize());
    }

    // Get the magnitude part
    var tempInt = 0;
    try {
      for (var i = 0; i < _SymbolArray.length; i++) {
        if (i > 1 && _EqualsIgnoreCase(sizePart, _SymbolArray[i])) {
          tempInt = i;
          break;
        } else if (sizePart ==
            _SymbolArray[i]) // sensitive comparison for b and B symbols
        {
          tempInt = i;
          break;
        }
      }
    } on Exception {
      return ParseOutput(true, ByteSize());
    }

    if (tempInt == 0) {
      var d1 = 1 * 1.0;
      if (_FloatingMod(number, d1) != 0) {
        // Can't have partial bits
        return ParseOutput(true, ByteSize());
      }

      return ParseOutput(false, ByteSize.FromBits(number.toInt()));
    } else if (tempInt == 1) {
      return ParseOutput(false, ByteSize.FromBytes(number));
    } else if (tempInt == 2) {
      return ParseOutput(false, ByteSize.FromKibiBytes(number));
    } else if (tempInt == 3) {
      return ParseOutput(false, ByteSize.FromKiloBytes(number));
    } else if (tempInt == 4) {
      return ParseOutput(false, ByteSize.FromMebiBytes(number));
    } else if (tempInt == 5) {
      return ParseOutput(false, ByteSize.FromMegaBytes(number));
    } else if (tempInt == 6) {
      return ParseOutput(false, ByteSize.FromGibiBytes(number));
    } else if (tempInt == 7) {
      return ParseOutput(false, ByteSize.FromGigaBytes(number));
    } else if (tempInt == 8) {
      return ParseOutput(false, ByteSize.FromTebiBytes(number));
    } else if (tempInt == 9) {
      return ParseOutput(false, ByteSize.FromTeraBytes(number));
    } else if (tempInt == 10) {
      return ParseOutput(false, ByteSize.FromPebiBytes(number));
    } else if (tempInt == 11) {
      return ParseOutput(false, ByteSize.FromPetaBytes(number));
    }
    return ParseOutput(true, ByteSize());
  } // end function TryParse

  /// Returns a ByteSize object by parsing a string value and
  /// throws an exception if argument is incorrectly formatted.
  ///
  /// ```dart
  /// ByteSize.Parse('1024MiB') == ByteSize.FromMebiBytes(1024);
  /// ```
  static ByteSize Parse(String value) {
    var output = TryParse(value);
    if (output.isExceptionThrown == true) {
      throw FormatException('Value is not in the correct format');
    }
    return output.byteSizeObj;
  } // end function Parse

} // end class ByteSize

/// It is the object returned by the TryParse static method of ByteSize class.
class ParseOutput {
  /// It is the ByteSize object that is returned.
  final ByteSize byteSizeObj;

  /// It denotes whether an exception was hit when parsing the argument.
  final bool isExceptionThrown;

  ParseOutput(this.isExceptionThrown, this.byteSizeObj);
} // end class ParseOutput
