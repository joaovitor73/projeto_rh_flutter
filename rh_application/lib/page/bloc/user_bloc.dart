
import 'package:flutter/material.dart';
import 'package:rh_application/data/datasource/remote_datasource.dart';
import 'package:rh_application/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource remoteDataSource;
  UserBloc({required this.remoteDataSource}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
        emit(UserLoading());
        try{
          final result = await remoteDataSource.getUser();
          emit(UserLoaded(data: result.data));
        }catch(e){
          emit(UserError(e.toString()));
        }
    });
  }
}
