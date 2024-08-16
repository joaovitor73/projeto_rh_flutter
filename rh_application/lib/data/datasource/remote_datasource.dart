import 'package:dio/dio.dart';
import 'package:rh_application/data/model/dataUse.dart';

class RemoteDataSource{
  
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));


  Future<DataUser> getUser() async{
    final response = await dio.get('/users');
    return DataUser.fromModel(response.data);
  }
}