import 'package:flutter/material.dart';
import 'imc.dart'; // Importa o arquivo que contém a tela de cálculo do IMC
import 'contador.dart'; // Importa o arquivo que contém a tela do contador
import 'cadastroUser.dart'; // Importa o arquivo que contém a tela de cadastro de usuário
import 'cadrastroProduto.dart'; // Importa o arquivo que contém a tela de cadastro de produtos

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"), // Título da AppBar
        centerTitle: true, // Centraliza o título na AppBar
        backgroundColor: Colors.pink, // Cor de fundo da AppBar
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Espaçamento interno
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os filhos à largura máxima
          children: <Widget>[
            const Icon(
              Icons.add_business_sharp, // Ícone exibido na tela
              size: 120.0,
              color: Colors.pink, // Cor do ícone
            ),
            Text(
              "Tela home", // Texto exibido na tela
              textAlign: TextAlign.center, // Alinha o texto ao centro
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0), // Estilo do texto
            ),
            Text(
              "", // Espaçamento entre os textos
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("IMC"), // Texto exibido no botão
                  onPressed: () {
                    // Navega para a tela de cálculo do IMC quando o botão é pressionado
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> const Imc()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Contador"), // Texto exibido no botão
                  onPressed: () {
                    // Navega para a tela do contador quando o botão é pressionado
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> const Cont()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Cadastro Usuario"), // Texto exibido no botão
                  onPressed: () {
                    // Navega para a tela de cadastro de usuário quando o botão é pressionado
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> const CadastroUser()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Cadastro de produtos"), // Texto exibido no botão
                  onPressed: () {
                    // Navega para a tela de cadastro de produtos quando o botão é pressionado
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> const CadastroProduto()));
                  },
                ),
              ],
            ),
          ],
        ),
      ), // Botão para executar o calculo do IMC,
    );
  }
}