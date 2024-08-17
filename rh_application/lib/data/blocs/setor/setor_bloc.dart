import 'dart:async';

import 'package:rh_application/data/blocs/setor/setor_events.dart';
import 'package:rh_application/data/blocs/setor/setor_state.dart';
import 'package:rh_application/data/model/setor.dart';
import 'package:rh_application/data/repository/setorReporitory.dart';

class SetorBloc{
    final repository = SetorRepository();

    final StreamController<SetorEvent> _inputController = StreamController<SetorEvent>();
    final StreamController<SetorState> _outputControler = StreamController<SetorState>();

    Sink<SetorEvent> get input => _inputController.sink;
    Stream<SetorState> get output => _outputControler.stream;

    SetorBloc(){
      _inputController.stream.listen(mapEventToState);
    }

    void mapEventToState(SetorEvent event) async{
      List<Setor> setores = [];

      _outputControler.add(SetorLoading());
      
      if(event is GetSetor){
        setores = await repository.getSetor();
      }else if(event is PostSetor){
          await repository.addSetor(setor: event.setor);
      }else if(event is DeleteSetor){
          await repository.deleteSetor(setor: event.setor);
      }
      _outputControler.add(SetorLoaded(setores: setores));
    }
}