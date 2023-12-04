import 'dart:math';
import 'dart:io';

void main() {

  var file = File('file.txt');
  List<String> theCards = file.readAsLinesSync();

  var sum = 0;
  theCards.forEach((card) {
    // parse line into winning numbers and your numbers
    var (winning, yours) = splitNums(card);
    // get the total matches for each line i.e. game
    sum += sumMatches(winning, yours);
  });

  print(sum);
}

(List<String>, List<String>) splitNums(String nums) {
  // firs split
  var splitted = nums.split("|");

  // split first value and discard anything before ":", 
  // so you now have the winning numbers. and then split that into a list
  // used regex for any number of spaces
  var winningNums =
      splitted.first.trimRight().split(':').last.trim().split(RegExp(r'\s+'));
  
  var yourNums = splitted.last.trimLeft().split(' ');

  return (winningNums, yourNums);
}

int sumMatches(List<String> winning, List<String> yourNums) {
  // multiply by two for every match
  int power = yourNums.where((num) => winning.contains(num)).length;

  var total = pow(2, power - 1);

  return total.toInt();
}
