import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rh_application/data/datasource/remote_datasource.dart';
import 'package:rh_application/page/bloc/user_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
      create: (context) => UserBloc(remoteDataSource: RemoteDataSource())..add(LoadUser()), 
      child: Scaffold(

        appBar: AppBar(
          title: const Text('Users'),
        ),

        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
              if(state is UserLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state is UserLoaded){
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(state.data[index].avatar),
                      ),
                      title: Text(state.data[index].firstName),
                      subtitle: Text(state.data[index].email),
                    );
                  },
                );
              }else if(state is UserError){
                return Center(
                  child: Text(state.message),
                );
              }else{
                return const Center(
                  child: Text('Press the button to load data'),
                );
              }
          }
        ),
      )
    );
  }
}