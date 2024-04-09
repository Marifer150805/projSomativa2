import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela contador'), // Título da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        backgroundColor: Colors.purple, // Cor de fundo da AppBar
      ),
      body: Center(
        // Botão que leva para a tela de cadastro de usuários
        child: ElevatedButton(
          child: const Text('Leva pra tela de cadastro dos usuarios'), // Texto do botão
          // Quando o botão é pressionado, navega para a rota '/CadastroUser'
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/CadastroUser',
            );
          },
        ),
      ),
    );
  }
}

// Classe do widget contador
class Cont extends StatefulWidget {
  const Cont({super.key});

  @override
  State<Cont> createState() => _ContPageState();
}

// Variável para armazenar o contador
class _ContPageState extends State<Cont> {
  int _counter = 0;

  // Função para incrementar o contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Função para decrementar o contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Cor de fundo da AppBar
        title: Text("Contador"), // Título da AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique abaixo pra aumentar ou diminuir os numeros',
            ),
            Text(
              '$_counter', // Exibe o valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // Estilo do texto
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter, // Incrementa o contador quando pressionado
                  child: const Icon(Icons.add), // Ícone de adição
                ),
                ElevatedButton(
                  onPressed: _decrementCounter, // Decrementa o contador quando pressionado
                  child: const Icon(Icons.remove), // Ícone de subtração
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}