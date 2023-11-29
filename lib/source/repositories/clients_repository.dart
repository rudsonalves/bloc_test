import 'package:bloc_test/source/commom/models/clients.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(name: 'Rudson Alves'),
      Client(name: 'Juliana Boasquevisque'),
      Client(name: 'Sandra Rocha'),
      Client(name: 'Simone Almeida'),
      Client(name: 'Edir Antônio'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
