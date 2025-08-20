import 'package:flutter/material.dart';
import '../main.dart';
import 'resultado.dart';

class QuizPage extends StatefulWidget {
  final String nomeJogador;

  const QuizPage({super.key, required this.nomeJogador});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int perguntaAtual = 0;
  int pontuacao = 0;

  final List<Pergunta> perguntas = [
    Pergunta("Qual a capital do Brasil?",
        ["São Paulo", "Brasília", "Rio de Janeiro"], 1),
    Pergunta("Quanto é 7 x 8?", ["54", "56", "64"], 1),
    Pergunta("Quem desenvolveu a linguagem Dart?",
        ["Apple", "Google", "Microsoft"], 1),
    Pergunta("Qual desses é um sistema operacional?",
        ["Python", "Linux", "HTML"], 1),
    Pergunta("Qual desses animais é um mamífero?",
        ["Tubarão", "Golfinho", "Jacaré"], 1),
  ];

  void responder(int indice) {
    if (indice == perguntas[perguntaAtual].respostaCorreta) {
      pontuacao++;
  }

    if (perguntaAtual + 1 < perguntas.length) {
      setState(() {
        perguntaAtual++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(
            nomeJogador: widget.nomeJogador,
            pontuacao: pontuacao,
            total: perguntas.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var pergunta = perguntas[perguntaAtual];
    return Scaffold(
      appBar: AppBar(title: Text("Pergunta ${perguntaAtual + 1}")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pergunta.enunciado,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...List.generate(pergunta.alternativas.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => responder(index),
                  child: Text(pergunta.alternativas[index]),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}