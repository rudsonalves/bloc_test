import 'package:bloc_test/source/commom/models/clients.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final Client client;

  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  final Client client;

  RemoveClientEvent({
    required this.client,
  });
}
