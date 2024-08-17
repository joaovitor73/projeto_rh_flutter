import 'package:rh_application/data/model/setor.dart';

abstract class SetorState {
  final List<Setor> setores;
  SetorState({required this.setores});
}

class SetorInitial extends SetorState {
  SetorInitial() : super(setores: []);
}

class SetorLoading extends SetorState {
  SetorLoading() : super(setores: []);
}

class SetorLoaded extends SetorState {
  SetorLoaded({required List<Setor> setores}) : super(setores: setores);
}

class SetorError extends SetorState {
  final Exception message;
  SetorError({required this.message}) : super(setores: []);
}