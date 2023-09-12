import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../domain/album_model.dart';
import 'album_base_api_client.dart';

class AlbumApiClient extends AlbumBaseApiClient{

  @override
  String get clientApiURL => 'albums/1';

  Dio dio = Dio();


  Future<Album> fetchAlbum() async {

    // final response = await http.get(Uri.parse('$baseAPIAddress$clientApiURL'));

    final response = await dio.get('$baseAPIAddress$clientApiURL');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Album.fromMap(jsonDecode(response.body));
      print(response.toString());
      return Album.fromMap(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}