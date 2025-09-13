class StringCalculator {
  int calculate(String input) {
    if (input.isEmpty) {
      return 0;
    }
    if (input.contains(',')) {
      return input.split(',').map(int.parse).reduce((a, b) => a + b);
    }
    if (input.contains('\n')) {
      return input.split('\n').map(int.parse).reduce((a, b) => a + b);
    }
    return int.parse(input);
  }
}