import 'package:flutter/material.dart';
import 'package:monty_hall_problem_flutter/bl/game.dart';
import 'package:monty_hall_problem_flutter/bl/simulation.dart';
import 'package:monty_hall_problem_flutter/pages/result_page.dart';

class GamePage extends StatefulWidget {
  GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final MontyHallSimulation simulation = MontyHallSimulation();
  final MontyHallGame game = MontyHallGame();
  String message = "Выберите дверь:";
  int? selectedDoor;
  bool isGameStarted = false;

  void _selectDoor(int door) {
    setState(() {
      selectedDoor = door;
      game.userSelectsDoor(door);
      message = "Вы выбрали дверь $door. Хотите сменить дверь?";
      isGameStarted = true;
    });
  }

  void _switchDoor() {
    setState(() {
      bool win = game.switchDoor();
      message = win ? "Вы выиграли машину!" : "Вы проиграли, это была коза.";
      isGameStarted = false;
    });
  }

  void _stickWithChoice() {
    setState(() {
      bool win = game.stickWithChoice();
      message = win ? "Вы выиграли машину!" : "Вы проиграли, это была коза.";
      isGameStarted = false;
    });
  }

  void _runSimulation() {
    simulation.runSimulation(1000);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(simulation)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monty Hall Paradox')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            if (!isGameStarted) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDoor(0),
                    child: const Text('Дверь 1'),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDoor(1),
                    child: const Text('Дверь 2'),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDoor(2),
                    child: const Text('Дверь 3'),
                  ),
                ],
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _switchDoor,
                    child: const Text('Сменить дверь'),
                  ),
                  ElevatedButton(
                    onPressed: _stickWithChoice,
                    child: const Text('Оставить выбор'),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _runSimulation,
              child: const Text('Запустить симуляцию на 1000 игр'),
            ),
          ],
        ),
      ),
    );
  }
}
