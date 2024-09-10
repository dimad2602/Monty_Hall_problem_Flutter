import 'game.dart';

class MontyHallSimulation {
  int switchWins = 0;
  int stickWins = 0;

  void runSimulation(int gamesCount) {
    for (int i = 0; i < gamesCount; i++) {
      MontyHallGame game = MontyHallGame();
      game.userSelectsDoor(0); // Выбор пользователя — всегда дверь 0

      if (game.switchDoor()) {
        switchWins++;
      } else {
        stickWins++;
      }
    }
  }
}