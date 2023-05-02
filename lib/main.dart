import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _finalizado = false;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'] as List<String>,
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'] as List<String>,
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Léo', 'Pedro'] as List<String>,
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      _finalizado = _perguntaSelecionada == _perguntas.length;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: _finalizado
            ? Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Você acabou o questionário, obrigado por participar!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Column(
                children: [
                  Text(
                    _perguntas[_perguntaSelecionada]['texto'] as String,
                  ),
                  ...(_perguntas[_perguntaSelecionada]['respostas'] as List<String>)
                      .map((resposta) {
                    return ElevatedButton(
                      child: Text(resposta),
                      onPressed: _responder,
                    );
                  }).toList(),
                ],
              ),
      ),
    );
  }
}
