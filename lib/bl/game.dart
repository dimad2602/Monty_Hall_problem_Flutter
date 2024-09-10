import 'dart:math';

class MontyHallGame {
  final Random rnd = Random();
  late int _carDoor;
  late int _userChoice;
  late int _openedGoatDoor;

  MontyHallGame() {
    _carDoor = rnd.nextInt(3);
  }

  void userSelectsDoor(int choice) {
    _userChoice = choice;
    _openedGoatDoor = _getGoatDoor();
  }

  int _getGoatDoor() {
    for (int i = 0; i < 3; i++) {
      if (i != _carDoor && i != _userChoice) return i;
    }
    return -1;
  }

  bool switchDoor() {
    for (int i = 0; i < 3; i++) {
      if (i != _userChoice && i != _openedGoatDoor) {
        _userChoice = i;
        break;
      }
    }
    return _userChoice == _carDoor;
  }

  bool stickWithChoice() {
    return _userChoice == _carDoor;
  }
}
