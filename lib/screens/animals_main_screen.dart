import 'package:barnanimals/datasource/animals_data.dart';
import 'package:barnanimals/models/animal_model.dart';
import 'package:flutter/material.dart';

///Esse é um exemplo de código de tela, ele geralmente tem um material widget
///no início, nesse caso o Scaffold que herda o tema do MaterialApp
///Cada tela do seu app o ideal é que seja separado em arquivos diferentes
class AnimalMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text('Animais'),
      ),
      backgroundColor: Colors.limeAccent,
      body: SafeArea(
        child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return AnimalCard(animal: animals[index]);
          },
        ),
      ),
    );
  }
}

///Esse é um modelo de um widget customizado, ao invés de usar uma função como
///você tinha feito o ideal é criar uma classe de widget, assim ela reutilizável
///e herda outras propriedades da classe widget, nesse caso um stateless widget
///Repare que se esse widget tiver como objetivo somente ser utilizado nessa tela
///você pode mantê-lo neste mesmo arquivo, porém se for reutilizá-lo em outra
///tela de seu app o ideal é que ele seja separado em um arquivo diferente
///normalmente temos uma pasta só de widgets para esses widgets personalizados
///Também vale ressaltar a importância de modelar as classes, aqui seu widget só
///recebe a classe modelo e monta seu conteúdo com base nela
class AnimalCard extends StatelessWidget {
  final AnimalModel animal;
  const AnimalCard({
    Key? key,
    required this.animal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          animal.tocarSom();
        },
        child: Container(
          child: Image.asset(
            animal.imageAsset,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
