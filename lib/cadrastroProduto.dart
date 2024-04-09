import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter

// Esta classe representa a tela inicial do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // O widget principal 'Scaffold' define a estrutura básica do app
        appBar: AppBar(
          title:  Text('Tela de cadastro dos produtos'), // Título da barra de navegação
          centerTitle: true, // Centraliza o título
          backgroundColor: Colors.blueAccent, // Cor de fundo da barra de navegação
        ),
        body: Center(
          child: ElevatedButton(
            // Botão que retorna para a tela inicial ao ser clicado
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text ('voltar') // Texto exibido no botão
          ),
        )
    );
  }
}

// Esta classe representa a tela de cadastro de produto.
class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  //Campos de texto 'nome' e 'descricao'.
  TextEditingController nomeController =TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  String _textInfo = "Informe seus dados"; // String para armazenar a mensagem de informação exibida na tela.

  // Função para cadastrar o produto
  void _cadastro() {
    setState(() {
      String nome = nomeController.text;
      String descricao = descricaoController.text;
      if (nome.isEmpty || descricao.isEmpty) {
        _textInfo = "O campos estão vazios"; // Atualiza a mensagem de informação
      } else {
        _textInfo = "Produto foi cadastrado com sucesso"; // Atualiza a mensagem de informação
      }

    });
  }
  // Função para limpar os campos de texto e a mensagem de informação.
  void _limpar_tela(){
    nomeController.text = ""; // Limpa o campo de texto do nome do produto
    descricaoController.text = ""; // Limpa o campo de texto da descrição do produto
    setState(() {
      _textInfo = "Informe os dados do produto"; // Atualiza a mensagem de informação
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"), // Título da barra de navegação
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blueAccent, // Cor de fundo da barra de navegação
        actions: <Widget>[ // Ícones de ação na barra de navegação
          IconButton(onPressed: _limpar_tela, icon: Icon(Icons.refresh)) // Ícone para limpar a tela
        ],
      ),
      // Corpo da tela com scroll caso o conteúdo ultrapasse a tela.
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Preenchimento interno
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os widgets na largura máxima
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.blueAccent,
            ), // Ícone de pessoa
            // Campo de texto para inserir o nome do produto.
            TextField(
              keyboardType: TextInputType.text, // Tipo de teclado
              decoration: InputDecoration(
                  labelText: "Nome do produto",
                  labelStyle: TextStyle(color: Colors.blueAccent)), // Texto de dica do campo
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0), // Estilo do texto
              controller: nomeController, // Controlador do campo de texto
            ),
            // Campo de texto para inserir a descrição do produto
            TextField(
              keyboardType: TextInputType.text, // Tipo de teclado
              decoration: InputDecoration(
                  labelText: "Descricao do produto",
                  labelStyle: TextStyle(color: Colors.blueAccent)), // Texto de dica do campo
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0), // Estilo do texto
              obscureText: true, // Esconde o texto digitado
              controller: descricaoController, // Controlador do campo de texto
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10), // Preenchimento com espaçamento
              child: SizedBox(
                height: 50.0, // Altura fixa do botão
                child: ElevatedButton(
                  onPressed: _cadastro, // Função que será chamada quando o botão for pressionado
                  child: const Text("Cadastre-se"), // Texto do botão
                ),
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 25.0), // Estilo do texto
            )
          ],
        ),
      ),
    );
  }
}