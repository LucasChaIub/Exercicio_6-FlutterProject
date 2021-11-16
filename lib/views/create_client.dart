// ignore_for_file: prefer_const_constructors_in_immutables, must_call_super, annotate_overrides, unused_local_variable, prefer_const_constructors, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:exe6/models/clients.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class CreateClient extends StatefulWidget {
  CreateClient(this.clients, {Key? key}) : super(key: key);
  final List<Client> clients;
  @override
  _CreateClientState createState() => _CreateClientState();
}

class _CreateClientState extends State<CreateClient> {
  final formKey = GlobalKey<FormState>();
  final controllerNome = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerCPF = TextEditingController();
  String? sexo = 'Masculino';

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEmail.dispose();
    controllerTelefone.dispose();
    controllerCPF.dispose();
    super.dispose();
  }

  void createClient() {
    final String nome = controllerNome.text;
    final String email = controllerEmail.text;
    final String cpf = controllerCPF.text;
    final String telefone = controllerTelefone.text;
    int cod;

    if (widget.clients.isEmpty) {
      cod = 1;
    } else {
      final Client client = widget.clients
          .reduce((current, next) => current.cod < next.cod ? next : current);

      cod = client.cod + 1;
    }

    widget.clients.insert(
      0,
      Client(
          cod: cod,
          nome: nome,
          email: email,
          cpf: cpf,
          telefone: telefone,
          sexo: sexo),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Cliente Cadastrado Com Sucesso'),
      elevation: 4,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));

    resetFields();
    FocusScope.of(context).unfocus();
  }

  void resetFields() {
    controllerNome.text = '';
    controllerEmail.text = '';
    controllerCPF.text = '';
    controllerTelefone.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Cadastro de Cliente',
          style: TextStyle(
            color: Colors.yellow[600],
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.yellow[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade800,
                Colors.grey.shade900,
              ],
            ),
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    label: 'Nome',
                    controller: controllerNome,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Campo Obrigatório'
                        : null,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'E-mail',
                    controller: controllerEmail,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Campo Obrigatório';
                      } else if (!validator.isEmail(text)) {
                        return 'E-mail inválido';
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'CPF',
                    controller: controllerCPF,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    label: 'Telefone',
                    controller: controllerTelefone,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  OptionsButton(
                      onChanged: (value) => setState(() => sexo = value)),
                  SizedBox(height: 150),
                  Container(
                    width: 280,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow.shade600),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.shade900,
                            Colors.grey.shade800,
                          ]),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            createClient();
                          }
                        },
                        child: Text(
                          'Finalizar Cadastro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white, fontSize: 18),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow.shade600, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      controller: controller,
      validator: validator,
    );
  }
}

class OptionsButton extends StatelessWidget {
  const OptionsButton({Key? key, required this.onChanged}) : super(key: key);

  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.black,
      decoration: InputDecoration(
        labelText: 'Sexo',
        labelStyle: TextStyle(color: Colors.yellow.shade600, fontSize: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow.shade600, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: 'Masculino',
      items: [
        DropdownMenuItem(
          child: Text(
            'Masculino',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Masculino',
        ),
        DropdownMenuItem(
          child: Text(
            'Feminino',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Feminino',
        ),
        DropdownMenuItem(
          child: Text(
            'Outro',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Outro',
        ),
      ],
      onChanged: onChanged,
    );
  }
}
