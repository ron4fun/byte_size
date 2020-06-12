import 'package:byte_size/byte_size.dart';
import 'package:intl/intl.dart';
import 'package:locales/locales.dart';
import 'package:test/test.dart';

void main() {
  String formatOutputLocale(
      num digits, int precision, String symbol, Locale locale_LANG) {
    var format = NumberFormat.decimalPattern('${locale_LANG}');
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
      final result = size1.Add(size1);

      expect(d2, result.Bytes);
      expect(i16, result.Bits);
    });

    test('AddBitsMethod', () {
      final size = ByteSize.FromBytes(1).AddBits(8);

      expect(d2, size.Bytes);
      expect(i16, size.Bits);
    });

    test('AddBytesMethod', () {
      final size = ByteSize.FromBytes(1).AddBytes(1);

      expect(d2, size.Bytes);
      expect(i16, size.Bits);
    });

    test('AddKiloBytesMethod', () {
      final d1 = 4 * 1024;
      final d2 = 4;
      final size = ByteSize.FromKiloBytes(2).AddKiloBytes(2);

      expect(4 * 1024 * 8, size.Bits);
      expect(d1, size.Bytes);
      expect(d2, size.KiloBytes);
    });

    test('AddMegaBytesMethod', () {
      final d1 = 4 * 1024 * 1024;
      final d2 = 4 * 1024;
      final d3 = 4;
      final size = ByteSize.FromMegaBytes(2).AddMegaBytes(2);

      expect(4 * 1024 * 1024 * 8, size.Bits);
      expect(d1, size.Bytes);
      expect(d2, size.KiloBytes);
      expect(d3, size.MegaBytes);
    });

    test('AddGigaBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024;
      final d3 = 4.0 * 1024;
      final d4 = 4.0;
      final size = ByteSize.FromGigaBytes(2).AddGigaBytes(2);

      expect(d0, size.Bits);
      expect(d1, size.Bytes);
      expect(d2, size.KiloBytes);
      expect(d3, size.MegaBytes);
      expect(d4, size.GigaBytes);
    });

    test('AddTeraBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024 * 1024;
      final d3 = 4.0 * 1024 * 1024;
      final d4 = 4.0 * 1024;
      final d5 = 4.0;

      final size = ByteSize.FromTeraBytes(2).AddTeraBytes(2);

      expect(d0, size.Bits);
      expect(d1, size.Bytes);
      expect(d2, size.KiloBytes);
      expect(d3, size.MegaBytes);
      expect(d4, size.GigaBytes);
      expect(d5, size.TeraBytes);
    });

    test('AddPetaBytesMethod', () {
      final d0 = 4.0 * 1024 * 1024 * 1024 * 1024 * 1024 * 8;
      final d1 = 4.0 * 1024 * 1024 * 1024 * 1024 * 1024;
      final d2 = 4.0 * 1024 * 1024 * 1024 * 1024;
      final d3 = 4.0 * 1024 * 1024 * 1024;
      final d4 = 4.0 * 1024 * 1024;
      final d5 = 4.0 * 1024;
      final d6 = 4.0;

      final size = ByteSize.FromPetaBytes(2).AddPetaBytes(2);

      expect(d0, size.Bits);
      expect(d1, size.Bytes);
      expect(d2, size.KiloBytes);
      expect(d3, size.MegaBytes);
      expect(d4, size.GigaBytes);
      expect(d5, size.TeraBytes);
      expect(d6, size.PetaBytes);
    });

    test('SubtractMethod', () {
      final size = ByteSize.FromBytes(4).Subtract(ByteSize.FromBytes(2));

      expect(16, size.Bits);
      expect(2, size.Bytes);
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
      expect(d0, result.Bits);
      expect(byteSize, result.Bytes);
      expect(d1, result.KiloBytes);
      expect(d2, result.MegaBytes);
      expect(d3, result.GigaBytes);
      expect(d4, result.TeraBytes);
      expect(1, result.PetaBytes);
    });

    test('FromBitsMethod', () {
      // Arrange
      final val = 8;

      // Act
      final result = ByteSize.FromBits(val);

      // Assert
      expect(8, result.Bits);
      expect(1, result.Bytes);
    });

    test('FromBytesMethod', () {
      // Act
      final result = ByteSize.FromBytes(val);

      // Assert
      expect(12, result.Bits);
      expect(d0, result.Bytes);
    });

    test('FromKiloBytesMethod', () {
      // Act
      final result = ByteSize.FromKiloBytes(val);

      // Assert
      expect(1536, result.Bytes);
      expect(d0, result.KiloBytes);
    });

    test('FromMegaBytesMethod', () {
      // Act
      final result = ByteSize.FromMegaBytes(val);

      // Assert
      expect(1572864, result.Bytes);
      expect(d0, result.MegaBytes);
    });

    test('FromGigaBytesMethod', () {
      // Act
      final result = ByteSize.FromGigaBytes(val);

      // Assert
      expect(1610612736, result.Bytes);
      expect(d0, result.GigaBytes);
    });

    test('FromTeraBytesMethod', () {
      // Act
      final result = ByteSize.FromTeraBytes(val);

      // Assert
      expect(1649267441664, result.Bytes);
      expect(d0, result.TeraBytes);
    });

    test('FromPetaBytesMethod', () {
      // Act
      final result = ByteSize.FromPetaBytes(val);

      // Assert
      expect(1688849860263936, result.Bytes);
      expect(d0, result.PetaBytes);
    });
  });

  group('ParsingMethodsTest', () {
    test('Parse', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('TryParse', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.TryParse(val);

      expect(result.IsExceptionThrown, isFalse);
      expect(expected, result.ByteSizeObj);
    });

    test('ParseDecimalMB', () {
      final val = '100.5MB';
      final expected = ByteSize.FromMegaBytes(100.5);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('TryParseReturnsFalseOnBadValue', () {
      final val = 'Unexpected Value';
      final result = ByteSize.TryParse(val);

      expect(result.IsExceptionThrown, true);
      expect(ByteSize(), result.ByteSizeObj);
    });

    test('TryParseReturnsFalseOnMissingMagnitude', () {
      final val = '1000';
      final result = ByteSize.TryParse(val);

      expect(result.IsExceptionThrown, true);
      expect(ByteSize(), result.ByteSizeObj);
    });

    test('TryParseReturnsFalseOnMissingValue', () {
      final val = 'KB';
      final result = ByteSize.TryParse(val);

      expect(result.IsExceptionThrown, true);
      expect(ByteSize(), result.ByteSizeObj);
    });

    test('TryParseWorksWithLotsOfSpaces', () {
      final val = ' 100 KB ';
      final expected = ByteSize.FromKiloBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, result);
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

      expect(expected, result);
    });

    test('ParseBytes', () {
      final val = '1B';
      final expected = ByteSize.FromBytes(1);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('ParseKB', () {
      final val = '1020KB';
      final expected = ByteSize.FromKiloBytes(1020);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('ParseMB', () {
      final val = '1000MB';
      final expected = ByteSize.FromMegaBytes(1000);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('ParseGB', () {
      final val = '805GB';
      final expected = ByteSize.FromGigaBytes(805);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('ParseTB', () {
      final val = '100TB';
      final expected = ByteSize.FromTeraBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });

    test('ParsePB', () {
      final val = '100PB';
      final expected = ByteSize.FromPetaBytes(100);
      final result = ByteSize.Parse(val);

      expect(expected, result);
    });
  });

  group('ToStringMethodTest', () {
    test('ReturnsLargestMetricSuffix', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.ToString();
      final expected = formatOutputLocale(lDouble, 2, 'KB', Locale.en_US);

      // Assert
      expect(expected, result);
    });

    test('ReturnsDefaultNumberFormat', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.ToString('KB');
      final expected = formatOutputLocale(lDouble, 2, 'KB', Locale.en_US);

      // Assert
      expect(expected, result);
    });

    test('ReturnsProvidedNumberFormat', () {
      final lDouble = 10.1234;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.1234);

      // Act
      final result = b.ToString('KB', 4);
      final expected = formatOutputLocale(lDouble, 4, 'KB', Locale.en_US);

      // Assert
      expect(expected, result);
    });

    test('ReturnsBits', () {
      // Arrange
      final b = ByteSize.FromBits(10);

      // Act
      final result = b.ToString('b');

      // Assert
      expect('10 b', result);
    });

    test('ReturnsBytes', () {
      // Arrange
      final b = ByteSize.FromBytes(10);

      // Act
      final result = b.ToString('B');

      // Assert
      expect('10 B', result);
    });

    test('ReturnsKiloBytes', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10);

      // Act
      final result = b.ToString('KB');

      // Assert
      expect('10 KB', result);
    });

    test('ReturnsMegaBytes', () {
      // Arrange
      final b = ByteSize.FromMegaBytes(10);

      // Act
      final result = b.ToString('MB');

      // Assert
      expect('10 MB', result);
    });

    test('ReturnsGigaBytes', () {
      // Arrange
      final b = ByteSize.FromGigaBytes(10);

      // Act
      final result = b.ToString('GB');

      // Assert
      expect('10 GB', result);
    });

    test('ReturnsTeraBytes', () {
      // Arrange
      final b = ByteSize.FromTeraBytes(10);

      // Act
      final result = b.ToString('TB');

      // Assert
      expect('10 TB', result);
    });

    test('ReturnsPetaBytes', () {
      // Arrange
      final b = ByteSize.FromPetaBytes(10);

      // Act
      final result = b.ToString('PB');

      // Assert
      expect('10 PB', result);
    });

    test('ReturnsSelectedFormat', () {
      final lDouble = 10.0;

      // Arrange
      final b = ByteSize.FromTeraBytes(10);

      // Act
      final result = b.ToString('TB');
      final expected = formatOutputLocale(lDouble, 2, 'TB', Locale.en_US);

      // Assert
      expect(expected, result);
    });

    test('ReturnsLargestMetricPrefixLargerThanZero', () {
      // Arrange
      final b = ByteSize.FromMegaBytes(0.5);

      // Act
      final result = b.ToString('KB');

      // Assert
      expect('512 KB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsOne', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.ToString('MB', 2, Locale.fr_CA);

      // Assert
      expect('9,77 MB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsTwo', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.ToString('MB', 1, Locale.de_DE);

      // Assert
      expect('9,8 MB', result);
    });

    test('ReturnsLargestMetricSuffixUsingCustomFormatSettingsThree', () {
      final lDouble = 10.5;

      // Arrange
      final b = ByteSize.FromKiloBytes(10.5);

      // Act
      final result = b.ToString('KB', 1, Locale.de_DE);
      final expected = formatOutputLocale(lDouble, 1, 'KB', Locale.de_DE);

      // Assert
      expect(expected, result);
    });

    test('ReturnsLargestMetricSuffixUsingCurrentLocale', () {
      // Arrange
      final b = ByteSize.FromKiloBytes(10000);

      // Act
      final result = b.ToString('MB', 2, Locale.fr_CA);

      // Assert
      expect('9,77 MB', result);
    });
  });
}
