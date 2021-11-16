// ignore_for_file: must_call_super, annotate_overrides, prefer_const_constructors, avoid_unnecessary_containers

import 'package:exe6/models/clients.dart';
import 'package:flutter/material.dart';

class ClientList extends StatefulWidget {
  const ClientList(this.clients, {Key? key}) : super(key: key);
  final List<Client> clients;
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  late List<Client> clientsSearch;
  @override
  void initState() {
    super.initState();
    clientsSearch = widget.clients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Lista de Clientes',
          style: TextStyle(
            color: Colors.yellow[600],
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.yellow[600],
      ),
      body: Container(
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
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Digite um código',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellow.shade600, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  final int? val = int.tryParse(value);

                  if (val != null) {
                    clientsSearch = widget.clients
                        .where((client) => client.cod == val)
                        .toList();
                  } else {
                    clientsSearch = widget.clients;
                  }
                }),
              ),
            ),
            SizedBox(height: 16),
            if (clientsSearch.isEmpty)
              const Text(
                'Nenhum Cliente Encontrado :(',
                style: TextStyle(color: Colors.white),
              ),
            if (clientsSearch.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                itemCount: clientsSearch.length,
                itemBuilder: (context, index) {
                  final Client clientsAdd = clientsSearch[index];

                  return Container(
                    color:
                        index % 2 == 0 ? Colors.grey[200] : Colors.yellow[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Cod:'),
                          subtitle: Text(clientsAdd.cod.toString()),
                          visualDensity: VisualDensity(
                              vertical: VisualDensity.minimumDensity),
                        ),
                        ListTile(
                          title: const Text('Nome:'),
                          subtitle: Text(clientsAdd.nome),
                          visualDensity: VisualDensity(
                              vertical: VisualDensity.minimumDensity),
                        ),
                        ListTile(
                          title: const Text('Email:'),
                          subtitle: Text(clientsAdd.email),
                          visualDensity: VisualDensity(
                              vertical: VisualDensity.minimumDensity),
                        ),
                        if (![null, ''].contains(clientsAdd.cpf))
                          ListTile(
                            title: const Text('CPF:'),
                            subtitle: Text(clientsAdd.cpf!),
                            visualDensity: VisualDensity(
                                vertical: VisualDensity.minimumDensity),
                          ),
                        if (![null, ''].contains(clientsAdd.telefone))
                          ListTile(
                            title: const Text('Telefone:'),
                            subtitle: Text(clientsAdd.telefone!),
                            visualDensity: VisualDensity(
                                vertical: VisualDensity.minimumDensity),
                          ),
                        if (![null, ''].contains(clientsAdd.sexo))
                          ListTile(
                            title: const Text('Sexo:'),
                            subtitle: Text(clientsAdd.sexo!),
                            visualDensity: VisualDensity(
                                vertical: VisualDensity.minimumDensity),
                          ),
                      ],
                    ),
                  );
                },
              )),
          ],
        ),
      ),
    );
  }
}
