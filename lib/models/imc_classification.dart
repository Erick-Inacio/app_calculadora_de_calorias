import 'dart:math';
import 'package:app_imc/models/imc.dart';

class ImcClassification extends Imc {
  //atributos
  late double _underweight;
  late double _normalWeight;
  late double _overweight;
  late double _obesity;
  late double _obesityii;
  late String _infos;
  late String _degree;

  //Contrutores
  ImcClassification({required double height, required double weight})
      : super(height: height, weight: weight) {
    _classification();
    _calculateDegree();
    _infos = gerarInfos();
  }

  //Getters e Setters
  String get infos {
    return _infos;
  }

  String get degree => _degree;

  //Métodos
  void _classification() {
    _underweight = _calculate(18.5);
    _normalWeight = _calculate(24.9);
    _overweight = _calculate(29.9);
    _obesity = _calculate(34.9);
    _obesityii = _calculate(39.9);
  }

  double _calculate(double aux) {
    return (pow(height, 2).toDouble() * aux);
  }

  String gerarInfos() {
    return 'Abaixo do peso: < ${_underweight.toStringAsPrecision(3)}\n'
        'Normal: ${(_underweight + 0.1).toStringAsPrecision(3)} '
        '- ${_normalWeight.toStringAsPrecision(3)}\n'
        'Sobrepeso: ${(_normalWeight + 0.1).toStringAsPrecision(3)} '
        '- ${_overweight.toStringAsPrecision(3)}\n'
        'Obesidade I: ${(_overweight + 0.1).toStringAsPrecision(3)} '
        '- ${_obesity.toStringAsPrecision(3)}\n'
        'Obesidade II: ${_obesity.toStringAsPrecision(3)} '
        '- ${_obesityii.toStringAsPrecision(3)}\n'
        'Obesidade III: > ${(_obesityii + 0.1).toStringAsPrecision(3)}';
  }

  void _calculateDegree() {
    if (imc < 18.5) {
      _degree = 'Abaixo do peso';
    } else if (imc <= 24.9) {
      _degree = 'Peso normal';
    } else if (imc <= 29.9) {
      _degree = 'Acima do Peso';
    } else if (imc <= 34.9) {
      _degree = 'Obesidade I';
    } else if (imc <= 39.9) {
      _degree = 'Obesidade II';
    } else if (imc >= 40) {
      _degree = 'Obesidade III';
    }
  }

  //overrides
  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();

    map.addAll({
      'underweight': _underweight,
      'normalWeight': _normalWeight,
      'overweight': _overweight,
      'obesity': _obesity,
      'obesityii': _obesityii,
      'infos': _infos,
      'degree': _degree,
    });
    return map;
  }
}
