import 'package:clean_code/user_data/user_screen.dart';
import 'package:flutter/material.dart';

import 'album/presentation/album_screen.dart';
import 'listview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const UserScreen(),
      //home: const ListviewScreen(),
      home: const MyAlbumApp(),
    );
  }
}
