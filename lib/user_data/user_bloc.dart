import 'package:clean_code/model/refined_user_model.dart';
import 'package:clean_code/model/user_list.dart';
import 'package:clean_code/user_data/user_repo.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  final UserRepo _userRepo = UserRepo();

 // BehaviorSubject<List<Geo>> userBehavior = BehaviorSubject();
  BehaviorSubject<List<UserList>> userBehavior = BehaviorSubject();

 // Stream<List<Geo>> get userStream => userBehavior.stream;
  Stream<List<UserList>> get userStream => userBehavior.stream;

  fetchUserList() async {
    List<UserList> userList=await _userRepo.fetchUserList();
    if(userList!=null){
      userBehavior.sink.add(userList!);
    }
    else{
      userBehavior.sink.add([]);
    }
  }

  fetchRefUserList() async {
    List<UserList> userList=await _userRepo.fetchUserList();
    if(userList!=null){
      List<Geo> geo=[];
      userList.forEach((element) {geo.add(element!.address!.geo!);});
      print(geo.first.lng);
      //userBehavior.sink.add(geo!);
    }
    else{
      userBehavior.sink.add([]);
    }
  }
}