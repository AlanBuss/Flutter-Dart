import 'package:flutter/material.dart';
import 'resultado.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _finalizado = false;

  final _perguntas = [
    {
      'texto': 'Qual é a sua linguagem de programação favorita?',
      'respostas': ['Java', 'Python', 'JavaScript', 'C++']
    },
    {
      'texto': 'O que é Flutter?',
      'respostas': ['Uma linguagem de programação', 'Um framework', 'Um banco de dados', 'Um sistema operacional']
    },
    {
      'texto': 'Qual é a linguagem de programação usada para desenvolver apps com Flutter?',
      'respostas': ['Java', 'Kotlin', 'Swift', 'Dart']
    },
    {
      'texto': 'O que é o Dart?',
      'respostas': ['Uma linguagem de programação', 'Um framework', 'Um banco de dados', 'Um sistema operacional']
    },
    {
      'texto': 'O que é um Widget em Flutter?',
      'respostas': ['Um componente visual', 'Uma classe de banco de dados', 'Uma função de programação', 'Uma biblioteca de terceiros']
    },
    {
      'texto': 'O que é um Stateful Widget em Flutter?',
      'respostas': ['Um widget que pode ser atualizado dinamicamente', 'Um widget que não pode ser atualizado dinamicamente', 'Um widget que executa uma única vez', 'Um widget que é usado apenas em telas iniciais']
    },
    {
      'texto': 'O que é o hot reload em Flutter?',
      'respostas': ['Uma ferramenta para atualização rápida de código', 'Um comando para compilação de código', 'Uma biblioteca de terceiros', 'Uma linguagem de programação']
    },
    {
      'texto': 'O que é o MaterialApp em Flutter?',
      'respostas': ['Um widget para configuração de temas', 'Um widget para exibição de imagens', 'Um widget para exibição de texto', 'Um widget para exibição de listas']
    },
  ];

  void _responder() {
  setState(() {
    if (_perguntaSelecionada < _perguntas.length - 1) {
      _perguntaSelecionada++;
    } else {
      _finalizado = true;
    }
  });
}

  void _reiniciar() => setState(() {
        _perguntaSelecionada = 0;
        _finalizado = false;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: _finalizado
            ? Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Você acabou o questionário, obrigado por participar!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ElevatedButton(
                    child: Text('Reiniciar Quiz'),
                    onPressed: () {
                      setState(() {
                        _perguntaSelecionada = 0;
                        _finalizado = false;
                      });
                    },
                  ),
                ],
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

