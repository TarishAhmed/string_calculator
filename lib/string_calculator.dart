class StringCalculator {
  int calculate(String input) {
    if (input.isEmpty) {
      return 0;
    }
    return int.parse(input);
  }
}