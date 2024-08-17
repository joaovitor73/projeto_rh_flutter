import 'package:rh_application/data/model/setor.dart';

class SetorRepository{
  final List<Setor> setores = []; 

  Future<List<Setor>> getSetor() async{
    setores.add(Setor(id: 1, name: 'Setor 1')); 
    setores.add(Setor(id: 2, name: 'Setor 2'));
    setores.add(Setor(id: 3, name: 'Setor 3'));
    return Future.delayed(
      const Duration(seconds: 2), () {
        return setores;
    });
  }

  Future<void> addSetor({required Setor setor}) async{
    return Future.delayed(
      const Duration(seconds: 2), () {
        setores.add(setor);
    });
  }

  Future<void> deleteSetor({required Setor setor}) async{
    return Future.delayed(
      const Duration(seconds: 2), () {
        setores.remove(setor);
    });
  }

  Future<void> updateSetor({required Setor setor}) async{
    return Future.delayed(
      const Duration(seconds: 2), () {
        final index = setores.indexWhere((element) => element.id == setor.id);
        setores[index] = setor;
    });
  }
}