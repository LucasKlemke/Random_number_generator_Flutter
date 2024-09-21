import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RandomNumberGeneratorApp());
}

class RandomNumberGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomNumberGeneratorScreen(),
    );
  }
}

class RandomNumberGeneratorScreen extends StatefulWidget {
  @override
  _RandomNumberGeneratorScreenState createState() => _RandomNumberGeneratorScreenState();
}

class _RandomNumberGeneratorScreenState extends State<RandomNumberGeneratorScreen> {
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  int? _generatedNumber;

  void _generateRandomNumber() {
    final int min = int.parse(_minController.text);
    final int max = int.parse(_maxController.text);
    final random = Random();
    setState(() {
      _generatedNumber = min + random.nextInt(max - min + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de Números Aleatórios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _minController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor Mínimo',
              ),
            ),
            TextField(
              controller: _maxController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor Máximo',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomNumber,
              child: Text('Gerar Número'),
            ),
            SizedBox(height: 20),
            if (_generatedNumber != null)
              Text(
                'Número Gerado: $_generatedNumber',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}