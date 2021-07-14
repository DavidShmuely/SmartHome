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
    Response response = await get(Uri.parse('http://192.168.8.234/fairylights'));
    Map data = jsonDecode(response.body);
    print(data['fairyLights']);
    lights['value'] =  data['fairyLights'];
  }

  Future<void> getAcState() async{
    Response response = await get(Uri.parse('http://192.168.8.234/state'));
    Map data = jsonDecode(response.body);
    acState['isOn'] = data['power'];
    acState['mode'] = data['mode'];
    acState['temp'] = data['temp'];
    acState['fan'] = data['fan'];

  }
}
