import 'dart:convert';

import 'package:byte_size/byte_size.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  String formatOutputLocale(
      num digits, int precision, String symbol, String locale_LANG) {
    var format = NumberFormat.decimalPattern(locale_LANG);
    return '${format.format(double.parse(digits.toStringAsFixed(precision)))} $symbol';
  } // end function formatOutputLocale

  group('ArithmeticMethodsTest', () {
    final d2 = 2;
    final i16 = 16;

    setUp(() {
      // Empty
    });

    test('AddMethod', () {
      final size1 = ByteSize.FromBytes(1);
      final result = size1.add(size1);

      expect(d2, equals(result.Bytes));
      expect(i16, equals(result.Bits));
    });

    test('AddBitsMethod', () {
      final size = ByteSize.FromBytes(1).addBits(8);

      expect(d2, equals(size.Bytes));
      expect(i16, equals(size.Bits));
    });

    test('AddBytesMethod', () {
      final size = ByteSize.FromBytes(1).addBytes(1);

      expect(d2, equals(size.Bytes));
      expect(i16, equals(size.Bits));
    });

    test('AddKiloBytesMethod', () {
      final d1 = 4 * 1024;
      final d2 = 4;
      final size = ByteSize.FromKiloBytes(2).addKiloBytes(2);

      expect(4 * 1024 * 8, equals(size.Bits));
      expect(d1, equals(size.Bytes));
      expect(d2, equals(size.KiloBytes));
    });

    test('AddMegaBytesMethod', () {
      final d1 = 4 * 1024 * 1024;
      final d2 = 4 * 1024;
      final d3 = 4;
      final size = ByteSize.FromMegaBytes(2).addMegaBytes(2);

      expect(4 * 1024 * 1024 * 8, equals(size.Bits));
      expect(d1, equals(size.Bytes));
      expect(d2, equals(size.KiloBytes));
      expect(d3, equals(size.MegaBytes));
    });

    test('AddGigaBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024;
      final d3 = 4.0 * 1024;
      final d4 = 4.0;
      final size = ByteSize.FromGigaBytes(2).addGigaBytes(2);

      expect(d0, equals(size.Bits));
      expect(d1, equals(size.Bytes));
      expect(d2, equals(size.KiloBytes));
      expect(d3, equals(size.MegaBytes));
      expect(d4, equals(size.GigaBytes));
    });

    test('AddTeraBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024 * 1024;
      final d3 = 4.0 * 1024 * 1024;
      final d4 = 4.0 * 1024;
      final d5 = 4.0;

      final size = ByteSize.FromTeraBytes(2).addTeraBytes(2);

      expect(d0, equals(size.Bits));
      expect(d1, equals(size.Bytes));
      expect(d2, equals(size.KiloBytes));
      expect(d3, equals(size.MegaBytes));
      expect(d4, equals(size.GigaBytes));
      expect(d5, equals(size.TeraBytes));
    });

    test('AddPetaBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024 * 1024 * 1024;
      final d3 = 4.0 * 1024 * 1024 * 1024;
      final d4 = 4.0 * 1024 * 1024;
      final d5 = 4.0 * 1024;
      final d6 = 4.0;

      final size = ByteSize.FromPetaBytes(2).addPetaBytes(2);

      expect(d0, equals(size.Bits));
      expect(d1, equals(size.Bytes));
      expect(d2, equals(size.KiloBytes));
      expect(d3, equals(size.MegaBytes));
      expect(d4, equals(size.GigaBytes));
      expect(d5, equals(size.TeraBytes));
      expect(d6, equals(size.PetaBytes));
    });

    test('SubtractMethod', () {
      final size = ByteSize.FromBytes(4).subtract(ByteSize.FromBytes(2));

      expect(16, equals(size.Bits));
      expect(2, equals(size.Bytes));
    });
  });

  group('CreatingMethodsTest', () {
    final val = 1.5;
    final d0 = 1.5;

    test('cConstructor', () {
      // Arrange
      final byteSize = 1125899906842624;

      // Act
      final result = ByteSize(byteSize);

      final d0 = byteSize * 8;
      final d1 = byteSize / 1024;
      final d2 = byteSize / 1024 / 1024;
      final d3 = byteSize / 1024 / 1024 / 1024;
      final d4 = byteSize / 1024 / 1024 / 1024 / 1024;

      // Assert
      expect(d0, equals(result.Bits));
      expect(byteSize, equals(result.Bytes));
      expect(d1, equals(result.KiloBytes));
      expect(d2, equals(result.MegaBytes));
      expect(d3, equals(result.GigaBytes));
      expect(d4, equals(result.TeraBytes));
      expect(1, equals(result.PetaBytes));
    });

    test('FromBitsMethod', () {
      // Arrange
      final val = 8;

      // Act
      final result = ByteSize.FromBits(val);

      // Assert
      expect(8, equals(result.Bits));
      expect(1, equals(result.Bytes));
    });

    test('FromBytesMethod', () {
      // Act
      final result = ByteSize.FromBytes(val);

      // Assert
      expect(12, equals(result.Bits));
      expect(d0, equals(result.Bytes));
    });

    test('FromKiloBytesMethod', () {
      // Act
      final result = ByteSize.FromKiloBytes(val);

      // Assert
      expect(1536, equals(result.Bytes));
      expect(d0, equals(result.KiloBytes));
    });

    test('FromMegaBytesMethod', () {
      // Act
      final result = ByteSize.FromMegaBytes(val);

      // Assert
      expect(1572864, equals(result.Bytes));
      expect(d0, equals(result.MegaBytes));
    });

    test('FromGigaBytesMethod', () {
      // Act
      final result = ByteSize.FromGigaBytes(val);

      // Assert
      expect(1610612736, equals(result.Bytes));
      expect(d0, equals(result.GigaBytes));
    });

    test('FromTeraBytesMethod', () {
      // Act
      final result = ByteSize.FromTeraBytes(val);

      // Assert
      expect(1649267441664, equals(result.Bytes));
      expect(d0, equals(result.TeraBytes));
    });

    test('FromPetaBytesMethod', () {
      // Act
      final result = ByteSize.FromPetaBytes(val);

      // Assert
      expect(1688849860263936, equals(result.Bytes));
      expect(d0, equals(result.PetaBytes));
    });
  });

  group('ParsingMethodsTest', () {
    test('Parse', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('TryParse', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.TryParse(val);

      expect(result.isExceptionThrown, isFalse);
      expect(expected, equals(result.byteSizeObj));
    });

    test('ParseDecimalMB', () {
      final val = '100.5MB';
      final expected = ByteSize.FromMegaBytes(100.5);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('TryParseReturnsFalseOnBadValue', () {
      final val = 'Unexpected Value';
      final result = ByteSize.TryParse(val);

      expect(result.isExceptionThrown, isTrue);
      expect(ByteSize(), equals(result.byteSizeObj));
    });

    test('TryParseReturnsFalseOnMissingMagnitude', () {
      final val = '1000';
      final result = ByteSize.TryParse(val);

      expect(result.isExceptionThrown, isTrue);
      expect(ByteSize(), equals(result.byteSizeObj));
    });

    test('TryParseReturnsFalseOnMissingValue', () {
      final val = 'KB';
      final result = ByteSize.TryParse(val);

      expect(result.isExceptionThrown, isTrue);
      expect(ByteSize(), equals(result.byteSizeObj));
    });

    test('TryParseWorksWithLotsOfSpaces', () {
      final val = ' 100 KB ';
      final expected = ByteSize.FromKiloBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParsePartialBits', () {
      final val = '10.5b';

      expect(() => ByteSize.Parse(val),
          throwsA(predicate((e) => e is FormatException)));
    });

    test('ParseThrowsOnInvalid', () {
      final badValue = 'Unexpected Value';

      expect(() => ByteSize.Parse(badValue),
          throwsA(predicate((e) => e is FormatException)));
    });

    test('ParseBits', () {
      final val = '1b';
      final expected = ByteSize.FromBits(1);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParseBytes', () {
      final val = '1B';
      final expected = ByteSize.FromBytes(1);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParseKB', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParseMB', () {
      final val = '1000MB';
      final expected = ByteSize.FromMegaBytes(1000);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParseGB', () {
      final val = '805GB';
      final expected = ByteSize.FromGigaBytes(805);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParseTB', () {
      final val = '100TB';
      final expected = ByteSize.FromTeraBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });

    test('ParsePB', () {
      final val = '100PB';
      final expected = ByteSize.FromPetaBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, equals(result));
    });
  });

  group('ToStringMethodTest', () {
    test('ReturnsLargestMetricSuffix', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.toString();
      final expected = formatOutputLocale(lDouble, 2, 'KB', 'en_US');

      // Assert
      expect(expected, result);
    });

    test('ReturnsDefaultNumberFormat', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.toString('KB');
      final expected = formatOutputLocale(lDouble, 2, 'KB', 'en_US');

      // Assert
      expect(expected, result);
    });

    test('ReturnsProvidedNumberFormat', () {
      final lDouble = 10.1234;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.1234);

      // Act
      final result = b.toString('KB', 4);
      final expected = formatOutputLocale(lDouble, 4, 'KB', 'en_US');

      // Assert
      expect(expected, result);
    });

    test('ReturnsBits', () {
      // Arrange
      final b = ByteSize.FromBits(10);

      // Act
      final result = b.toString('b');

      // Assert
      expect('10 b', result);
    });

    test('ReturnsBytes', () {
      // Arrange
      final b = ByteSize.FromBytes(10);

      // Act
      final result = b.toString('B');

      // Assert
      expect('10 B', result);
    });

    test('ReturnsKiloBytes', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10);

      // Act
      final result = b.toString('KB');

      // Assert
      expect('10 KB', result);
    });

    test('ReturnsMegaBytes', () {
      // Arrange
      final b = ByteSize.FromMegaBytes(10);

      // Act
      final result = b.toString('MB');

      // Assert
      expect('10 MB', result);
    });

    test('ReturnsGigaBytes', () {
      // Arrange
      final b = ByteSize.FromGigaBytes(10);

      // Act
      final result = b.toString('GB');

      // Assert
      expect('10 GB', result);
    });

    test('ReturnsTeraBytes', () {
      // Arrange
      final b = ByteSize.FromTeraBytes(10);

      // Act
      final result = b.toString('TB');

      // Assert
      expect('10 TB', result);
    });

    test('ReturnsPetaBytes', () {
      // Arrange
      final b = ByteSize.FromPetaBytes(10);

      // Act
      final result = b.toString('PB');

      // Assert
      expect('10 PB', result);
    });

    test('ReturnsSelectedFormat', () {
      final lDouble = 10.0;

      // Arrange
      final b = ByteSize.FromTeraBytes(10);

      // Act
      final result = b.toString('TB');
      final expected = formatOutputLocale(lDouble, 2, 'TB', 'en_US');

      // Assert
      expect(expected, result);
    });

    test('ReturnsLargestMetricPrefixLargerThanZero', () {
      // Arrange
      final b = ByteSize.FromMegaBytes(0.5);

      // Act
      final result = b.toString('KB');

      // Assert
      expect('512 KB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsOne', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.toString('MB', 2, 'fr_CA');

      // Assert
      expect('9,77 MB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsTwo', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.toString('MB', 1, 'de_DE');

      // Assert
      expect('9,8 MB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsThree', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.toString('KB', 1, 'de_DE');
      final expected = formatOutputLocale(lDouble, 1, 'KB', 'de_DE');

      // Assert
      expect(expected, result);
    });

    test('ReturnsLargestMetricSuffixUsingCurrentLocale', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.toString('MB', 2, 'fr_CA');

      // Assert
      expect('9,77 MB', result);
    });
  });

  group('ComparableMethodTest', () {
    final b1 = ByteSize(1);
    final b2 = ByteSize(2);
    final b3 = ByteSize.FromBytes(3);

    test('Returns0', () {
      final b1 = ByteSize(1);
      final b2 = ByteSize(1);
      final b3 = ByteSize.FromBytes(1);

      expect(b1.compareTo(b2), equals(0));
      expect(b2.compareTo(b3), equals(0));
    });

    test('Returns1', () {
      expect(b2.compareTo(b1), equals(1));
      expect(b3.compareTo(b2), equals(1));
    });

    test('Returns-1', () {
      expect(b1.compareTo(b2), equals(-1));
      expect(b2.compareTo(b3), equals(-1));
    });

    test('CheckListSorting', () {
      var list_sizes = <ByteSize>[b2, b3, b1];

      assert(b1.compareTo(list_sizes[2]) == 0);
      assert(b2.compareTo(list_sizes[0]) == 0);
      assert(b3.compareTo(list_sizes[1]) == 0);

      list_sizes.sort();

      expect(b1.compareTo(list_sizes[0]), equals(0));
      expect(b2.compareTo(list_sizes[1]), equals(0));
      expect(b3.compareTo(list_sizes[2]), equals(0));
    });
  });

  group('UtilityMethodTest', () {
    test('copy', () {
      ByteSize? val = ByteSize(1024);
      var bs = val.copy();

      expect(bs, isNotNull);
      expect(bs.compareTo(val), equals(0));
      expect(bs.Bits, equals(val.Bits));
      expect(bs.toString(), equals(val.toString()));

      val = null;

      expect(val, isNull);
      expect(bs, isNotNull);
    });

    test('toJson', () {
      final bs = ByteSize(1024);

      var encoder = JsonEncoder();
      var jsonText = encoder.convert(bs);

      var decoder = JsonDecoder();
      var obj = decoder.convert(jsonText) as Map;

      expect(bs.Bits.toString(), equals(obj['b']));
      expect(bs.Bytes.toStringAsFixed(20), equals(obj['B']));
      expect(bs.KiloBytes.toStringAsFixed(20), equals(obj['KB']));
      expect(bs.MegaBytes.toStringAsFixed(20), equals(obj['MB']));
      expect(bs.GigaBytes.toStringAsFixed(20), equals(obj['GB']));
      expect(bs.TeraBytes.toStringAsFixed(20), equals(obj['TB']));
      expect(bs.PetaBytes.toStringAsFixed(20), equals(obj['PB']));
    });

    test('fromJson', () {
      final json = {'B': 1024, 'KB': 1}; // 1024 Bytes == 1KB
      var bs = ByteSize.fromJson(json);

      expect(json['B'], equals(bs.Bytes));
      expect(json['KB'], equals(bs.KiloBytes));
      expect(bs.MegaBytes, isNotNull);

      // Taking Precedence into consideration
      final json2 = {'KB': '1024', 'B': '10000', 'GB': '20'};
      bs = ByteSize.fromJson(json2);

      expect(double.parse(json2['B']!) == bs.Bytes, isTrue);
      expect(double.parse(json2['KB']!) == bs.KiloBytes, isFalse);
      expect(double.parse(json2['GB']!) == bs.GigaBytes, isFalse);

      final json3 = {'KB': '1024', 'GB': '20'};
      bs = ByteSize.fromJson(json3);

      expect(double.parse(json2['KB']!) == bs.KiloBytes, isTrue);
      expect(double.parse(json2['GB']!) == bs.GigaBytes, isFalse);
    });
  });
}
