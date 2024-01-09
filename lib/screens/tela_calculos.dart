import 'package:app_imc/models/user_app.dart';
import 'package:app_imc/widgets/cards/personalized.dart';
// import 'package:app_imc/widgets/textFields/form_field.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key, required this.userApp});

  final UserApp userApp;

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  // final TextEditingController _targetWeight = TextEditingController();
  // TextEditingController height = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String infoText = 'Informe seus dados';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculos'),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CardPesonalized(
                      title: 'Classificação atual',
                      textBody:
                          'Imc: ${widget.userApp.imcClassification.imc.toStringAsPrecision(3)}'
                          '\nFaixa: ${widget.userApp.imcClassification.degree}',
                    ),
                    CardPesonalized(
                      title: 'Informações',
                      textBody: widget.userApp.imcClassification.infos,
                    ),
                    CardPesonalized(
                      title: 'Estimativa Energética',
                      textBody: '${widget.userApp.eer.round().toString()} kcal',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    //   child: MyFormField(
                    //     label: 'Peso na faixa "normal"',
                    //     controller: _targetWeight,
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//   void resetField() {
//     _targetWeight.clear();
//     // heightControl.clear();
//     // infoText = 'Informe seus dados';
//     _formKey = GlobalKey<FormState>();
//   }
//         setState(() {
//           FocusScope.of(context).unfocus();
//           // infoText = imc.degree;
//         });
//       }
//     } else {
//       setState(() {
//         infoText = 'Informe seus dados';
//       });
//     }
//   }
}
