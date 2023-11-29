import 'package:bloc/bloc.dart';
import 'package:bloc_test/source/blocs/client_states.dart';
import 'package:bloc_test/source/blocs/clients_events.dart';
import 'package:bloc_test/source/repositories/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepository = ClientsRepository();

  // final _inputClientcontroller = StreamController<ClientEvent>();
  // final _outputClientcontroller = StreamController<ClientState>();

  // Sink<ClientEvent> get inputClient => _inputClientcontroller.sink;
  // Stream<ClientState> get srteam => _outputClientcontroller.stream;

  ClientBloc() : super(ClientInitialState()) {
    // _inputClientcontroller.stream.listen(_mapEventState);
    on<LoadClientEvent>(
      (evet, emit) =>
          emit(ClientSuccessState(clients: _clientRepository.loadClients())),
    );

    on<AddClientEvent>(
      (event, emit) => emit(ClientSuccessState(
          clients: _clientRepository.addClient(event.client))),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(ClientSuccessState(
          clients: _clientRepository.removeClient(event.client))),
    );
  }

  // void _mapEventState(ClientEvent event) {
  //   List<Client> clients = [];

  //   if (event is LoadClientEvent) {
  //     clients = _clientRepository.loadClients();
  //   } else if (event is AddClientEvent) {
  //     clients = _clientRepository.addClient(event.client);
  //   } else if (event is RemoveClientEvent) {
  //     clients = _clientRepository.removeClient(event.client);
  //   }

  //   _outputClientcontroller.add(ClientSuccessState(clients: clients));
  // }
}
