import 'dart:math';
import 'dart:io';

void main() {
 

  var file = File('inp2.txt');
  List<String> theCards = file.readAsLinesSync();

  var (first, second) = splitNums(cards[0]);

  var sum = 0;
  // create array that stores the number of copies each game has
  // initially each game has 1 copy
  List<int> quantities = List.filled(theCards.length, 1);

  for (var c in theCards) {
    // parse into winning and your numbers
    var (first, second) = splitNums(c);
    //obtain matches of game
    // how many instances/copies does current value have
    var currentCopies = quantities[theCards.indexOf(c)];

    // for [matches] amount of indexes after current one,
    // update their value by the number of current copies
    // the current game has
    // since each instance/copy of the game gives us copies of those next games
    int matches = sumMatches(first, second);
    if (matches > 0) {
      // index checking so that we don't violate the bounds of the list
      int start = theCards.indexOf(c) == theCards.length - 1
          ? theCards.length - 1
          : theCards.indexOf(c) + 1;
      int end = start + matches;

      for (int i = start; i < end; i++) {
        quantities[i] += currentCopies;
      }
    }
  }

  // find the sum of all values
  int theSum = quantities.fold(0, (summa, c) => summa + c);
  print(theSum.runtimeType);

  print('the sum : $theSum');

  //for (var )
}

(List<String>, List<String>) splitNums(String nums) {
  var splitted = nums.split("|");

  var winningNums =
      splitted.first.trimRight().split(':').last.trim().split(RegExp(r'\s+'));
  var yourNums = splitted.last.trimLeft().split(' ');

  return (winningNums, yourNums);
}

int sumMatches(List<String> winning, List<String> yourNums) {
  var matches = yourNums.where((num) => winning.contains(num)).length;
  return matches;
}
