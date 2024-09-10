import 'package:flutter/material.dart';
import 'package:monty_hall_problem_flutter/bl/simulation.dart';

class ResultPage extends StatelessWidget {
  final MontyHallSimulation simulation;

  const ResultPage(this.simulation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Результаты симуляции')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Победы при смене двери: ${simulation.switchWins}'),
            Text('Победы при сохранении выбора: ${simulation.stickWins}'),
          ],
        ),
      ),
    );
  }
}
