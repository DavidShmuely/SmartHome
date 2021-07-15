import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Room{
  String name;
  String url;
  Map acState = {'power':false,'mode':1,'temp': 16,'fan': 1};
  Map lights = {'isOn':false,'value': 1};
  int fairyLights = 0;

  Room({required this.name, required this.url}){
    getFairyLights();
  }

  Future<void> getFairyLights() async {
    //http request
    try {
      Response response = await get(Uri.parse('$url/fairylights'));
      Map data = jsonDecode(response.body);
      print(data['fairyLights']);
      lights['value'] = data['fairyLights'];
    } catch(e){
      lights['value'] = 999;
      print(lights['value']);
    }
  }

  Future<void> getAcState() async{
    Response response = await get(Uri.parse('$url/state'));
    Map data = jsonDecode(response.body);
    acState['isOn'] = data['power'];
    acState['mode'] = data['mode'];
    acState['temp'] = data['temp'];
    acState['fan'] = data['fan'];

  }
}
