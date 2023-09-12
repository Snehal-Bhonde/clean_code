import 'package:clean_code/model/user_list.dart';
import 'package:dio/dio.dart';

class UserRepo{
  final Dio _dio=Dio();

  final String url="https://jsonplaceholder.typicode.com/users";

  Future<List<UserList>> fetchUserList() async{
    Response? response;
    response= await _dio.get(url);

    if (response.statusCode == 200) {
      List<UserList> list = (response.data as List).map((x) => UserList.fromJson(x)).toList();
      print(list);
      return list;
    } else {
      throw Exception(response.statusMessage);
    }
  }

}