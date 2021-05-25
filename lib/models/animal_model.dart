///O ideal é modelar seus dados, no caso os animais do seu exemplo são sua fonte
///de dados, ou seja, eles são um objeto, logo modelamos ele com uma classe dart
///com os parâmetros necessários de modo a facilitar a trabalhar com esses dados
///seja na hora de receber os dados de uma base de dados (no caso aque a base é
///apenas uma lista estática, mas poderia estar vindo de um servidor online).
///Além disso a modelagem permite você isolar tudo referente as responsabilidades
///do objeto somente nesta classe, para facilitar a manutenção, neste exemplo
///temos o método tocarSom, que seria uma função do objeto animal.
class AnimalModel {
  String name;
  String imageAsset;
  String soundAsset;
  AnimalModel({
    required this.name,
    required this.imageAsset,
    required this.soundAsset,
  });

  void tocarSom() {
    final player = AudioCache();
    player.play(soundAsset);
  }
}
