import 'package:flutter/material.dart';
import '../main.dart';

class ResultadoPage extends StatelessWidget {
  final String nomeJogador;
  final int pontuacao;
  final int total;

  const ResultadoPage(
      {super.key,
      required this.nomeJogador,
      required this.pontuacao,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Parabéns, $nomeJogador!",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Sua pontuação: $pontuacao de $total",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NomeJogadorPage()),
                );
              },
              child: const Text("Jogar novamente"),
            )
          ],
        ),
      ),
    );
  }
}