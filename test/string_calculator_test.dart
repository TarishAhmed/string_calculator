import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('String Calculator', () {
    StringCalculator calculator = StringCalculator();

    setUp(() {
      calculator = StringCalculator();
    });

    // Empty string returns 0
    test('Empty string returns 0', () {
      expect(calculator.add(''), 0);
    });

    // Single number returns the number
    test('Single number returns the number', () {
      expect(calculator.add('1'), 1);
    });

    // Two numbers delimited by comma returns the sum
    test('Two numbers, comma delimited, returns the sum', () {
      expect(calculator.add('1,2'), 3);
    });

    // any amount of numbers delimited by comma returns the sum
    test('Any amount of numbers, comma delimited, returns the sum', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });

    // handle newlines between numbers delimited by comma returns the sum
    test('Handle newlines between numbers delimited by comma returns the sum',
        () {
      expect(calculator.add('1\n2,3'), 6);
    });

    // Edge case handling different custom delimiters
    test('should support different custom delimiters', () {
      expect(calculator.add('//|\n1|2|3'), equals(6));
      expect(calculator.add('//***\n1***2***3'), equals(6));
    });

    // blocking negative numbers
    test('should throw exception for negative numbers', () {
      expect(
        () => calculator.add('-1'),
        throwsA(isA<ArgumentError>().having(
          (e) => e.message,
          'message',
          contains('negative numbers not allowed'),
        )),
      );
    });

    // showing all the negative numbers which caused the exception
    test('should show all negative numbers in exception message', () {
      expect(
        () => calculator.add('-1,2,-3'),
        throwsA(isA<ArgumentError>().having(
          (e) => e.message,
          'message',
          contains('-1, -3'),
        )),
      );
    });
  });
}
