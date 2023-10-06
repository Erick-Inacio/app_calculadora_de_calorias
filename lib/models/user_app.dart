import 'package:app_imc/models/imc_classification.dart';

//classe singleton
class UserApp {
  //atributos
  final String _name;
  final int _age;
  final ImcClassification _imcClassification;
  final String _sexo;

  //atributo estático para a chamada única
  static UserApp? _instance;

  //construtor interno da classe singleton
  UserApp._internal({
    required String name,
    required int age,
    required ImcClassification imcClassification,
    required String sexo,
  })  : _name = name,
        _age = age,
        _imcClassification = imcClassification,
        _sexo = sexo;

  //getter e setters

  String get name => _name;
  int get age => _age;
  ImcClassification get imcClassification => _imcClassification;
  String get sexo => _sexo;

  static UserApp get instance {
    if (_instance == null) {
      throw Exception('Instance not initialized, must call getInstance first!');
    } else {
      return _instance!;
    }
  }

  //métodos

  //método criado para inserir os valores da classe ST caso _instance seja null
  static getInstance({
    required String name,
    required int age,
    required ImcClassification imcClassification,
    required String sexo,
  }) {
    _instance ??= UserApp._internal(
      name: name,
      age: age,
      imcClassification: imcClassification,
      sexo: sexo,
    );
    return _instance;
  }

  //método para converter para map o objeto
  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'age': _age,
      'imcClassification': _imcClassification.toMap(),
      'sexo': _sexo,
    };
  }
}
