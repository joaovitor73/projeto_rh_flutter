import 'package:rh_application/data/model/user.dart';

class DataUser{
  final List<User> data;
  DataUser({
    required this.data,
  });
  factory DataUser.fromModel(
    Map<String, dynamic> json) => DataUser(
      data: List<User>.from(json['data'].map((x) => User.fromModel(x)))
    );
}