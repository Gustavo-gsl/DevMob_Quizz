import 'package:flutter/material.dart';
import 'screens/quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      debugShowCheckedModeBanner: false,
      home: const NomeJogadorPage(),
    );
  }
}
class NomeJogadorPage extends StatefulWidget {
  const NomeJogadorPage({super.key});

  @override
  State<NomeJogadorPage> createState() => _NomeJogadorPageState();
}

class _NomeJogadorPageState extends State<NomeJogadorPage> {
  final TextEditingController _controller = TextEditingController();

  void _iniciarQuiz() {
    if (_controller.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(nomeJogador: _controller.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-vindo ao Quizz",
          style: TextStyle(color: Colors.white)
          ),
          backgroundColor: Colors.deepPurple,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Digite seu nome:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(controller: _controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _iniciarQuiz,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text("Jogar",
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
            )
          ],
        ),
      ),
    );
  }
}