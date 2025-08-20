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
      appBar: AppBar(
        title: const Text("Resultado",
        style: TextStyle(color: Colors.white)
          ),
          backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pontuacao >= 3) ...[
              Text("Parabéns, $nomeJogador!",
                  style:
                      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
            ]else ...[
              Text("Um dia você consegue, $nomeJogador!",
                  style:
                      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
            ],
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text("Jogar Novamente",
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
            )
          ],
        ),
      ),
    );
  }
}