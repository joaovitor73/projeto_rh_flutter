import 'package:flutter/material.dart';
import 'package:rh_application/data/blocs/setor/setor_bloc.dart';
import 'package:rh_application/data/blocs/setor/setor_events.dart';
import 'package:rh_application/data/blocs/setor/setor_state.dart';
import 'package:rh_application/data/model/setor.dart';

class Setores extends StatefulWidget {
  const Setores({super.key});

  @override
  State<Setores> createState() => _SetoresState();
}

class _SetoresState extends State<Setores> {

  late final SetorBloc _setorBloc;
  
  @override
  void initState() {
    super.initState();
    _setorBloc = SetorBloc();
    _setorBloc.input.add(GetSetor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Setores'),
      ),

      body: StreamBuilder<SetorState>(
        stream: _setorBloc.output,
        builder: (context, state){
          if(state.hasData){
            if(state.data is SetorLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state.data is SetorLoaded){
              return ListView.builder(
                itemCount: (state.data as SetorLoaded).setores.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text((state.data as SetorLoaded).setores[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){
                        _setorBloc.input.add(DeleteSetor(setor: (state.data as SetorLoaded).setores[index]));
                      },
                  ),
                  );
                },
              );
            }else{
              return const Center(
                child: Text('Press the button to load data'),
              );
            }
          }else{
            return const Center(
              child: Text('Press the button to load data'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          _setorBloc.input.add(PostSetor(setor: Setor(id: 1, name: 'Setor 1')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  @override
    void dispose() {
      _setorBloc.input.close();
      super.dispose();
    }
}