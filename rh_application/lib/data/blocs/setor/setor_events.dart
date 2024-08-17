import 'package:rh_application/data/model/setor.dart';

abstract class SetorEvent {

}

class GetSetor extends SetorEvent {

}

class PostSetor extends SetorEvent {
  final Setor setor;
  PostSetor({required this.setor});
}

class DeleteSetor extends SetorEvent {
  final Setor setor;
  DeleteSetor({required this.setor});
}