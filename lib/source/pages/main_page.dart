import 'dart:math';

import 'package:bloc_test/source/blocs/client_bloc.dart';
import 'package:bloc_test/source/blocs/client_states.dart';
import 'package:bloc_test/source/blocs/clients_events.dart';
import 'package:flutter/material.dart';

import '../commom/models/clients.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.inputClient.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.inputClient.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return [
      'Jucelino Borgo',
      'Huston AlVere',
      'Carla Evaristo',
      'Tania Abeu',
      'Estevão Turak',
    ].elementAt(rand.nextInt(5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Test'),
        centerTitle: true,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () {
          bloc.inputClient.add(
            AddClientEvent(
              client: Client(name: randomName()),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: StreamBuilder<ClientState>(
          stream: bloc.srteam,
          builder: (context, AsyncSnapshot<ClientState> snapshot) {
            final clientsList = snapshot.data?.clients ?? [];

            return ListView.separated(
              itemCount: clientsList.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(clientsList[index].name.substring(0, 1)),
                  ),
                ),
                title: Text(clientsList[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    bloc.inputClient.add(
                      RemoveClientEvent(client: clientsList[index]),
                    );
                  },
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ),
    );
  }
}
