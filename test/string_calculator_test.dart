import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {



  group('String Calculator', () {
  
  StringCalculator stringCalculator = StringCalculator();
  // Empty string returns 0
  test('Empty string returns 0', () {
      expect(stringCalculator.calculate(''), 0);
    });

    // Single number returns the number
    test('Single number returns the number', () {
      expect(stringCalculator.calculate('1'), 1);
    });
    
    
  });
}