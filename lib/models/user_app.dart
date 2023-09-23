import 'package:app_imc/models/imc_classification.dart';

class UserApp {
  String name;
  int age;
  ImcClassification imcClassification;
  String sexo;

  UserApp({
    required this.name,
    required this.age,
    required this.imcClassification,
    required this.sexo,
  });
}
