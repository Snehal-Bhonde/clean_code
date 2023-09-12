import 'package:clean_code/model/user_list.dart';
import 'package:clean_code/user_data/user_bloc.dart';
import 'package:flutter/material.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key}) : super(key: key);
  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    _userBloc.fetchUserList();
    // _userBloc.fetchRefUserList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        StreamBuilder<List<UserList>>(
          // StreamBuilder<List<Geo>>(
            stream: _userBloc.userStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return Container(
                    height: double.maxFinite,
                    margin: const EdgeInsets.all(20),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: ListView(
                            children:<Text> [
                              Text("ID: ${snapshot.data![0].id}"),
                              Text("Name: ${snapshot.data![0].name}"),
                              Text("Email: ${snapshot.data![0].email}"),
                              Text("Phone: ${snapshot.data![0].phone}"),
                              Text("UserName: ${snapshot.data![0].username}"),
                              Text("Website: ${snapshot.data![0].website}"),
                              Text(
                                  "Company Name: ${snapshot.data![0].company!.name}"),
                              Text(
                                  "Company BS: ${snapshot.data![0].company!.bs}"),
                              Text("City: ${snapshot.data![0].address!.city}"),
                              Text("street: ${snapshot.data![0].address!.street}"),
                              Text("zipcode: ${snapshot.data![0].address!.zipcode}")
                            ],
                              ),
                        ),
                      ],
                      // child:
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data found'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

