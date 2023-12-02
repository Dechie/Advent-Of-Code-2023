import 'dart:io';

int parseInput(String str) {
  List<String> splitted = str.split(":");

  Map<String, int> allowedQuantities = {
    "red": 12,
    "green": 13,
    "blue": 14,
  };

  List<String> cubeSets = splitted[1].trim().split('; ');
  List<Map<String, String>> colorsPerSet = [];

  for (var cubeSet in cubeSets) {
    cubeSet.trimRight();
    cubeSet.trimLeft();
    cubeSet.split(', ').forEach((element) {
      element.trimLeft();
      element.trimRight();
      List<String> eachColor = element.split(' ');

      colorsPerSet.add(
        {
          "quantity": eachColor[0],
          "color": eachColor[1],
        },
      );
    });
  }
  for (var check in colorsPerSet) {
    if (int.parse(check['quantity']!) > allowedQuantities[check['color']]!) {
      return 0;
    }
  }
  return int.parse(splitted[0].trim().split(' ').last);
}

void main() {
  var file = File("input.txt");
  List<String> lines = file.readAsLinesSync();

  int summs = 0;
  for (var game in lines) {
    final val = parseInput(game);
    summs += val;
  }
  print(summs);
}
