import 'package:flutter/material.dart';//
import 'home.dart';//importa a classe home que é a principal
import 'imc.dart';//importa a segunda classe IMC
import 'contador.dart';//importa a classe contador
import 'cadrastroProduto.dart';//importa a clase do cadastro de produto
import 'cadastroUser.dart';//importa a clase do cadastro de usuers
void main() {
  runApp(const MyApp());//inicia a aplicação
}

class MyApp extends StatelessWidget { //Construtor da classe MyApp que recebe uma chave única (super.key)
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta o banner do Flutter
      home: Home(),// Define a tela inicial do aplicativo como a classe Home.
    );
  }
}