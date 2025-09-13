class StringCalculator {
  int add(String input) {
    if (input.isEmpty) {
      return 0;
    }

    // Check for custom delimiter format: //delimiter\nnumbers
    if (input.startsWith('//')) {
      int newlineIndex = input.indexOf('\n');
      if (newlineIndex != -1) {
        String delimiter = input.substring(2, newlineIndex);
        String numbersPart = input.substring(newlineIndex + 1);

        // Handle multi-character delimiters by escaping special regex characters
        String escapedDelimiter = RegExp.escape(delimiter);
        List<String> numbers = numbersPart
            .split(RegExp(escapedDelimiter))
            .where((s) => s.isNotEmpty)
            .toList();

        // Check for negative numbers and collect them
        List<String> negativeNumbers = [];
        for (var number in numbers) {
          if (int.parse(number) < 0) {
            negativeNumbers.add(number);
          }
        }
        
        // If any negative numbers found, throw error with all of them
        if (negativeNumbers.isNotEmpty) {
          throw ArgumentError('negative numbers not allowed: ${negativeNumbers.join(', ')}');
        }

        return numbers.map(int.parse).reduce((a, b) => a + b);
      }
    }

    // Handle both comma and newline delimiters
    if (input.contains(',') || input.contains('\n')) {
      // Split by both comma and newline, then filter out empty strings
      List<String> numbers =
          input.split(RegExp(r'[,\n]')).where((s) => s.isNotEmpty).toList();

      // Check for negative numbers and collect them
      List<String> negativeNumbers = [];
      for (var number in numbers) {
        if (int.parse(number) < 0) {
          negativeNumbers.add(number);
        }
      }
      
      // If any negative numbers found, throw error with all of them
      if (negativeNumbers.isNotEmpty) {
        throw ArgumentError('negative numbers not allowed: ${negativeNumbers.join(', ')}');
      }

      return numbers.map(int.parse).reduce((a, b) => a + b);
    }

    // Handle single number - check for negative
    int result = int.parse(input);
    if (result < 0) {
      throw ArgumentError('negative numbers not allowed: $result');
    }
    return result;
  }
}
