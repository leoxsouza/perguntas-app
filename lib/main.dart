import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    if(temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua matéria favorita?',
      'respostas': ['Desenvolvimento Mobile', 'Qualidade de Software', 'Empreendedorismo', 'Pesquisa Operacional']
    },
    {
      'texto': 'Qual é o sua área de interesse?',
      'respostas': ['Desenvolvimento', 'Infraestrutura', 'Gerência', 'Outros']
    },
    {
      'texto': 'Qual é seu professor favorito?',
      'respostas': ['Riciere', 'Léo Binda', 'Priscila', 'Thiago']
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada ? 
    _perguntas[perguntaSelecionada]['respostas'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(_perguntas[perguntaSelecionada]['texto']),
            ...respostas.map((t) => Resposta(t, responder)).toList(),
          ],
        ) : Resultado('Parabéns!'),
      ),
    );
  }
}
