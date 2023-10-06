import 'package:app_imc/models/imc_classification.dart';
import 'package:app_imc/models/user_app.dart';
import 'package:app_imc/screens/tela_calculos.dart';
import 'package:app_imc/services/firebase.dart';
import 'package:app_imc/themes/light_theme.dart';
import 'package:app_imc/widgets/textFields/form_field.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  bool _isSaving = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _sexo = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _name = TextEditingController();

  Sexo? sexo;
  // List<DropdownMenuEntry<String>> sexo = ['Masculino', 'Feminino'];

  @override
  void dispose() {
    _height;
    _weight;
    _age;
    _sexo;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<Sexo>> buildDropDownMenuEntry() {
      List<DropdownMenuEntry<Sexo>> entries = [];
      for (Sexo sexo in [Sexo.feminino, Sexo.masculino]) {
        entries.add(DropdownMenuEntry(value: sexo, label: sexo.label));
      }
      return entries;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Formulário',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IconButton(
                padding: const EdgeInsets.symmetric(vertical: 5),
                iconSize: 120,
                alignment: Alignment.center,
                color: colorTheme,
                onPressed: () {},
                icon: const Icon(Icons.supervised_user_circle),
              ),
              MyFormField(
                controller: _name,
                errorText: 'insira um nome válido',
                label: 'Nome',
                inputType: TextInputType.name,
              ),
              MyFormField(
                controller: _height,
                errorText: 'Insira uma altura válida',
                label: 'Altura (m)',
              ),
              MyFormField(
                controller: _weight,
                errorText: 'Insira um peso válido',
                label: 'Peso (kg)',
              ),
              //resolver o problema do widht fixo
              Align(
                alignment: Alignment.center,
                child: DropdownMenu<Sexo>(
                  initialSelection: Sexo.masculino,
                  controller: _sexo,
                  width: MediaQuery.of(context).size.width * 0.91,
                  label: const Text('Sexo'),
                  inputDecorationTheme: const InputDecorationTheme(
                    focusColor: Colors.green,
                    suffixIconColor: Colors.green,
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color.fromARGB(255, 218, 255, 219),
                    ),
                  ),
                  dropdownMenuEntries: buildDropDownMenuEntry(),
                ),
              ),
              MyFormField(
                controller: _age,
                label: 'Idade',
                errorText: 'Insira a Idade',
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() && !_isSaving) {
                    UserApp userApp = instanciarObjeto();
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    setState(() {
                      _isSaving = true;
                    });
                    try {
                      await UserRepository.saveUser(userApp);
                      if(mounted){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Calculation(userApp: userApp)),
                        ),
                      );
                      }
                    } catch (e) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(content: Text('Erro ao salvar os dados: $e')),
                      );
                    } finally {
                      setState(() {
                        _isSaving = false;
                      });
                    }
                  }
                },
                child: _isSaving
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Próximo',
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  UserApp instanciarObjeto() {
    ImcClassification imcClassification = ImcClassification(
      height: double.parse(_height.text),
      weight: double.parse(_weight.text),
    );
    UserApp userApp = UserApp.getInstance(
      name: _name.text,
      age: int.parse(_age.text),
      imcClassification: imcClassification,
      sexo: _sexo.text,
    );

    return userApp;
  }
}

enum SexoType { masculino, feminino }

class Sexo {
  final SexoType type;
  final String label;

  const Sexo._(this.type, this.label);

  static const Sexo masculino = Sexo._(SexoType.masculino, 'Masculino');
  static const Sexo feminino = Sexo._(SexoType.feminino, 'Feminino');
}
