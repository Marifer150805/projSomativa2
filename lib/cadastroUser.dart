import 'package:flutter/material.dart';
import 'cadrastroProduto.dart'; // Importa o arquivo que contém a tela de cadastro de produtos

// Inicia o aplicativo
void main() {
  runApp(const MyApp()); // Executa o aplicativo
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor do widget

  @override
  Widget build(BuildContext context) { // Método que constrói a interface do widget

    return Scaffold( // Define a estrutura básica da tela do aplicativo
        appBar: AppBar( // Barra superior da tela
          title: const Text('Tela de cadastro de usuarios'), // Título centralizado
          centerTitle: true, // Centraliza o título
          backgroundColor: Colors.yellow, // Cor de fundo da barra
        ),
        body: Center( // Corpo da tela centralizado
          child: ElevatedButton( // Botão elevado
              child: const Text('Leva pra tela de cadastro dos produtos'), // Texto do botão
              onPressed: (){ // Ação ao pressionar o botão
                Navigator.pushNamed(
                    context,
                    '/CadastroProduto'  // Nome da rota para a tela de cadastro de produtos
                );
              }
          ),
        )
    );
  }
}

// Classe que representa a tela de cadastro de usuário
class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key}); // Construtor da classe

  @override
  State<CadastroUser> createState() => _CadastroUserState(); // Cria o estado da tela de cadastro de usuário
}

// Estado da tela de cadastro de usuário
class _CadastroUserState extends State<CadastroUser> {
  TextEditingController usuarioController =TextEditingController(); // Controlador para o campo de texto de usuário
  TextEditingController senhaController = TextEditingController(); // Controlador para o campo de texto de senha
  String _textInfo = "Informe seus dados";  // Mensagem de informação exibida na tela

  // Função para cadastrar o usuário
  void _cadastro() {
    setState(() {
      String user = usuarioController.text; // Obtém o texto digitado no campo de usuário
      String senha = senhaController.text; // Obtém o texto digitado no campo de senha
      if (user.isEmpty || senha.isEmpty) { // Verifica se os campos estão vazios
        _textInfo = "O campos estão vazios"; // Atualiza a mensagem de informação
      } else {
        _textInfo = "Usuario foi cadastrado com sucesso"; // Atualiza a mensagem de informação
      }
    });
  }

  // Função para limpar os campos de texto e a mensagem de informação
  void _limpar_tela(){
    usuarioController.text = ""; // Limpa o campo de texto de usuário
    senhaController.text = ""; // Limpa o campo de texto de senha
    setState(() {
      _textInfo = "Informe seus dados"; // Atualiza a mensagem de informação
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuario"), // Título da barra superior
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.yellow, // Cor de fundo da barra
        actions: <Widget>[ // Ícones de ação na barra superior
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh)) // Ícone para limpar a tela
        ],
      ),
      body: SingleChildScrollView( // Corpo da tela com capacidade de rolagem
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Preenchimento interno
        child: Column( // Coluna para organizar os widgets na vertical
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os widgets na largura máxima
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.yellow,
            ), // Ícone de pessoa
            TextField( // Campo de texto para inserir o nome de usuário
              keyboardType: TextInputType.text, // Tipo de teclado
              decoration: InputDecoration(
                  labelText: "Usuario",
                  labelStyle: TextStyle(color: Colors.yellow)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuarioController,
            ),
            TextField( // Campo de texto para inserir a senha do usuário
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.yellow)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              obscureText: true, // Esconde o texto digitado
              controller: senhaController,
            ),
            Padding( // Preenchimento com espaçamento
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox( // Define um tamanho fixo
                height: 50.0,
                child: ElevatedButton( // Botão elevado para cadastrar o usuário
                  onPressed: _cadastro,
                  child: const Text("Cadastre-se"), // Texto do botão
                ),
              ),
            ),
            Text( // Texto dinâmico para exibir a mensagem de informação
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.yellow, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}