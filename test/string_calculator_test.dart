import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {



  group('String Calculator', () {
  
  StringCalculator stringCalculator = StringCalculator();
  test('Empty string returns 0', () {
      expect(stringCalculator.calculate(''), 0);
    });
  });
}