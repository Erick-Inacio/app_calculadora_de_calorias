import 'package:app_imc/models/user_app.dart';

class Eer {
  //Atributos
  static late double weight;
  static late double height;
  static late int age;
  static late String sexo;

  //get e set

  // static double get eer => eer;

  //Métodos
  static double getEer(UserApp user) {
    double eer;

    weight = user.imcClassification.weight;
    height = user.imcClassification.height;
    age = user.age;
    sexo = user.sexo;

    //valida se a idade está entre 3 e 8 anos
    if (age >= 3 && age <= 8) {
      //se sim ele testa para ver se masculino ou feminino
      if (sexo == 'Masculino') {
        return eer =
            88.5 - 61.9 * age + 1 * (26.7 * weight + 903 * height) + 20;
      } else {
        return eer =
            135.3 - 30.8 * age + 1 * (10.0 * weight + 934 * height) + 20;
      }
      //valida se é menor ou igual a 18 anos
    } else if (age <= 18) {
      //se sim ele testa para ver se masculino ou feminino
      if (sexo == 'Masculino') {
        return eer =
            88.5 - 61.9 * age + 1 * (26.7 * weight + 903 * height) + 25;
      } else {
        return eer =
            135.3 - 30.8 * age + 1 * (10.0 * weight + 934 * height) + 25;
      }
      //valida se é maior a 19 anos
    } else if (age >= 19) {
      //se sim ele testa para ver se masculino ou feminino
      if (sexo == 'Masculino') {
        eer = 662 - 9.53 * age + 1 * (15.91 * weight + 539.6 * height);
        // print('\n\n$eer\n\n');
        return eer;
      } else {
        return eer = 354 - 6.91 * age + 1 * (9.36 * weight + 726 * height);
      }
    } else {
      throw 'idade inválida';
    }
  }
}
