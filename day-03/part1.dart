import 'dart:io';

void main() {
  var file = File('input_file.txt');
  List<String> entries = file.readAsLinesSync();
  var digitMatch = RegExp(r'\d+');

  var sum = 0;
  var p, n;
  for (String current in entries) {
    Iterable<Match> matches = digitMatch.allMatches(current);
    List<String> digs = matches
        .map(
          (match) => match.group(0)!,
        )
        .toList();

    int index = entries.indexOf(current);
    p = index == 0 ? entries[0] : entries[index - 1];
    n = index == entries.length - 1 ? entries[index] : entries[index + 1];

    var intermList = digs.where(
      (dig) {
        bool result = manipulate(dig, current, n, p);
        print('$dig passed condition: $result');
        return result;
      },
    ).toList();
    var intermSum = intermList.fold(
      0,
      (summa, dig) => summa + (int.tryParse(dig) ?? 0),
    );
    sum += intermSum;
  }
  print(sum);
}

bool manipulate(String suspect, String curr, String next, String prev) {
  var symbolMatch = RegExp(r'[$#@%+-/*=]');
  int prevBegin = curr.indexOf(suspect);
  int prevEnd = prevBegin + suspect.length - 1;
  int nextBegin = prevBegin, nextEnd = prevEnd;
  int ogBegin = prevBegin, ogEnd = prevEnd;

  (prevBegin, nextBegin) =
      (prevBegin > 0 ? prevBegin - 1 : 0, nextBegin > 0 ? nextBegin - 1 : 0);
  (prevEnd, nextEnd) = (
    prevEnd == prev.length - 1 ? prevEnd : prevEnd + 1,
    nextEnd == next.length - 1 ? nextEnd : nextEnd + 1
  );
  (ogBegin, ogEnd) = (
    ogBegin == 0 ? ogBegin : ogBegin - 1,
    ogEnd == curr.length - 1 ? ogEnd : ogEnd + 1
  );

  return symbolMatch.hasMatch(prev.substring(prevBegin, prevEnd)) ||
      symbolMatch.hasMatch(next.substring(nextBegin, nextEnd)) ||
      symbolMatch.hasMatch(curr[ogBegin]) ||
      symbolMatch.hasMatch(curr[ogEnd]);
}

