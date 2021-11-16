// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:exe6/models/clients.dart';
import 'package:exe6/views/client_list.dart';
import 'package:exe6/views/create_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChoicePage(),
  ));
}

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  List<Client> clients = <Client>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Gerencimento de Clientes',
          style: TextStyle(
            color: Colors.yellow[600],
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.yellow[600],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
          children: [
            SizedBox(height: 220),
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
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateClient(clients)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add,
                            color: Colors.yellow[600],
                            size: 35,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Cadastrar Cliente',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
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
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientList(clients)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.view_list_rounded,
                            color: Colors.yellow[600],
                            size: 35,
                          ),
                          SizedBox(width: 17),
                          Text(
                            'Lista de Clientes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
