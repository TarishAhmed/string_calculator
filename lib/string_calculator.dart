class StringCalculator {
  int calculate(String input) {
    if (input.isEmpty) {
      return 0;
    }
    // Handle both comma and newline delimiters
    if (input.contains(',') || input.contains('\n')) {
      // Split by both comma and newline, then filter out empty strings
      List<String> numbers = input
          .split(RegExp(r'[,\n]'))
          .where((s) => s.isNotEmpty)
          .toList();
      
      return numbers.map(int.parse).reduce((a, b) => a + b);
    }
    
    return int.parse(input);
  }
}