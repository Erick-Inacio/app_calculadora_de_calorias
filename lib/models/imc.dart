import 'dart:math';

class Imc {
  //atributos privados
  double _height;
  double _weight;
  double _imc;

  //construtor
  Imc({required double height, required double weight})
      : _height = height,
        _weight = weight,
        _imc = 0 {
    _calculateImc();
    if (height <= 0 || weight <= 0) {
      throw ArgumentError('height and weight must be greater than 0');
    }
  }

  //getters e setters
  double get height => _height;
  set height(double height) {
    _height = (height > 0) ? height : _height;
    _calculateImc();
  }

  double get weight => _weight;
  set weight(double weight) {
    _weight = (weight > 0) ? weight : _weight;
    _calculateImc();
  }

  double get imc => _imc;

  //métodos
  void _calculateImc() {
    _imc = weight / pow(height, 2);
  }
}
