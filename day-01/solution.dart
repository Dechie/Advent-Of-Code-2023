import 'dart:io';

(String, String) findDisguisedNums(String input, int end, int windowWidth) {

  List<String> testList = [
      "one", 
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
  ];
  
  int start = 0;
  int startEdge = start + windowWidth;    
  int endEdge = end - windowWidth; 
  
  
  String firstNum = '', secondNum = ''; 
  String firstTest = '', secondTest = '';
  
  while (start < endEdge && end > startEdge) {
    
    
    //firstTest = input.substring(start, startEdge); 
    //secondTest = input.substring(endEdge, end); 
    print('$input, ${end + 1} $start, $startEdge');

    if (testList.contains(firstTest)) {
      firstNum = firstTest;
    } else {
      start++;     
      startEdge++;
    }
    
    if (testList.contains(secondTest)) {
      secondNum = secondTest;
    } else {
      end--;     
      endEdge--;
    }
    
  }

  return (firstNum, secondNum);
} 

int findDigitFromString(String inp) {
    int end = inp.length - 1, start = 0;
    
    var firstWord = '', secondWord = '';
    final len = inp.length;
    if (len > 2) {
      if (len >= 3 && (firstWord == '' || secondWord == '')) {
        var (f, l) = findDisguisedNums(inp, inp.length - 1, 2);
        firstWord = (firstWord.isEmpty && f.isNotEmpty) ? f : '';
        secondWord = (secondWord.isEmpty && l.isNotEmpty) ? l : '';
      }
      
      
      if (len >= 4 && (firstWord == '' || secondWord == '')) {
        var (f, l) = findDisguisedNums(inp, inp.length - 1, 3);
        firstWord = (firstWord.isEmpty && f.isNotEmpty) ? f : '';
        secondWord = (secondWord.isEmpty && l.isNotEmpty) ? l : '';
      }
      
      if (len >= 5 && (firstWord == '' || secondWord == '')) {
        var (f, l) = findDisguisedNums(inp, inp.length - 1, 4);
        firstWord = (firstWord.isEmpty && f.isNotEmpty) ? f : '';
        secondWord = (secondWord.isEmpty && l.isNotEmpty) ? l : '';
      }
    } 

    Map<String, String> matchWords = {"zero": '0', "one": '1', "two": '2', "three": '3', "four": '4', "five": '5', "six": '6', "seven": '7', "eight": '8', "nine": '9'};
    
    String tens = matchWords[firstWord]!, ones = matchWords[secondWord]!;
    tens += ones;
    
    return int.parse(tens);
}
void main() async {
  
    var lines = await File('input_file.txt').readAsLines();

    for (var line in lines) {
        print(line + '  ' + findDigitFromString(line).toString());
        
      }
}



/*
def findDigits(input_string):
    digits = []
    for character in input_string:
        if character.isdigit():
            digits.append(character)
    
    
    firstLast = [digits[0], digits[-1]]
    return int(''.join(firstLast))
            
            
file1 = open("input_file.txt")

summa = 0
linesList = file1.readlines()

for line in linesList:
    summa += findDigits(line)
    
print(summa)
*/
