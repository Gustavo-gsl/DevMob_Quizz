import 'package:flutter/material.dart';
import 'resultado.dart';

class QuizPage extends StatefulWidget {
  final String nomeJogador;

  const QuizPage({super.key, required this.nomeJogador});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class Pergunta {
  final String enunciado;
  final List<String> alternativas;
  final int respostaCorreta;

  Pergunta(this.enunciado, this.alternativas, this.respostaCorreta);
}

class _QuizPageState extends State<QuizPage> {
  int perguntaAtual = 0;
  int pontuacao = 0;

  final List<Pergunta> perguntas = [
    Pergunta(
      "Normalmente, quantos litros de sangue uma pessoa tem?",
      [
        "Tem entre 2 a 4 litros",
        "Tem entre 4 a 6 litros",
        "Tem 10 litros",
        "Tem 7 litros",
        "Tem 0,5 litros"
      ],
      1),
    Pergunta(
      "De quem é a famosa frase \"Penso, logo existo\"?",
      [
        "Platão",
        "Galileu Galilei",
        "Descartes",
        "Sócrates",
        "Francis Bacon"
      ],
      2),
    Pergunta(
      "Qual o livro mais vendido no mundo a seguir da Bíblia?",
      [
        "O Senhor dos Anéis",
        "O Pequeno Príncipe",
        "Ela, a Feiticeira",
        "Um Conto de Duas Cidades",
        "Dom Quixote"
      ],
      4),
    Pergunta(
      "Qual a tradução da frase \"Fabiano cogio su saco antes de salir\"?",
      [
        "Fabiano coseu seu paleto antes de sair",
        "Fabiano fechou o saco antes de sair",
        "Fabiano cortou o saco antes de sair",
        "Fabiano pegou seu paleto antes de sair",
        "Fabiano rasgou seu paleto antes de sair"
      ],
      3),
    Pergunta(
      "Quem é o autor de \"O Príncipe\"?",
      [
        "Maquiavel",
        "Antoine de Saint-Exupery",
        "Montesquieu",
        "Thomas Hobbes",
        "Rousseau"
      ],
      0),
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
      appBar: AppBar(
        title: Text(
          "Pergunta ${perguntaAtual + 1}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pergunta.enunciado,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ...List.generate(pergunta.alternativas.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () => responder(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        fixedSize: const Size(250, 50),
                      ),
                      child: Text(
                        pergunta.alternativas[index],
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}