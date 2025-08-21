import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int? ultimaPontuacao;
  String? ultimoNome;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ultimaPontuacao = prefs.getInt('ultimaPontuacao');
      ultimoNome = prefs.getString('ultimoNome');
      if (ultimoNome != null) {
        _controller.text = ultimoNome!;
      }
    });
  }

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
            style: TextStyle(color: Colors.white)),
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
              const Text(
                "Digite seu nome:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: 250,
                  child: TextField(controller: _controller),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _iniciarQuiz,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Jogar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              if (ultimaPontuacao != null && ultimoNome != null) ...[
                const SizedBox(height: 30),
                Text(
                  "Último jogador: $ultimoNome\nPontuação: $ultimaPontuacao",
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}