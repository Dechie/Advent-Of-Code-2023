import 'dart:io';

int parseInput(String str) {
  List<String> splitted = str.split(":");

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

  var redVals = [], greenVals = [], blueVals = [];
  for (var check in colorsPerSet) {
    var quant = int.parse(check['quantity']!);
    switch (check['color']) {
      case "red":
        redVals.add(quant);
        break;
      case "green":
        greenVals.add(quant);
        break;
      case "blue":
        blueVals.add(quant);
        break;
    }
  }

  // find maximum value for each list
  var redMax =
      redVals.reduce((value, element) => value > element ? value : element);
  var greenMax =
      greenVals.reduce((value, element) => value > element ? value : element);
  var blueMax =
      blueVals.reduce((value, element) => value > element ? value : element);

  return redMax * greenMax * blueMax;
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
