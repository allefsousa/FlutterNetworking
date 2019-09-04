import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  int _offset;
// requisição http

  /**
   * Buscando os dados com Http e esperando um future com response
   */
  Future<Map> _getGifs() async {
    http.Response response;
    if (_search == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=XhI0XZAAEDwB1X6ED2T8VSSv8SVAFvBi&limit=25&rating=G");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=XhI0XZAAEDwB1X6ED2T8VSSv8SVAFvBi&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");
    }
    return json.decode(response.body);
  }

  /**
   * Printando os dados recebidos na tela
   */
  @override
  void initState() {
    super.initState();
    _getGifs().then((map){
      print(map);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }


}
