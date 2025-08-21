import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class ResultadoPage extends StatelessWidget {
  final String nomeJogador;
  final int pontuacao;
  final int total;

  const ResultadoPage({
    super.key,
    required this.nomeJogador,
    required this.pontuacao,
    required this.total,
  });

  Future<void> _salvarResultado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('ultimaPontuacao', pontuacao);
    await prefs.setString('ultimoNome', nomeJogador);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: _salvarResultado(),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (pontuacao >= 3) ...[
                  Text("Parabéns, $nomeJogador!",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                ] else ...[
                  Text("Um dia você consegue, $nomeJogador!",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                ],
                Text("Sua pontuação: $pontuacao de $total",
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NomeJogadorPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Text("Jogar novamente",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}