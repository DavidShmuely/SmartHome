import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class FairyLights extends StatefulWidget {
  @override
  _FairyLightsState createState() => _FairyLightsState();
}

class _FairyLightsState extends State<FairyLights> {
  double currentSliderValue = 10;
  int fairyLights = 0;

  Future<void> getData() async {
    //http request
    Response response = await get(Uri.parse('http://192.168.8.202/fairylights'));
    Map data = jsonDecode(response.body);
    print(data['fairyLights']);
    fairyLights = data['fairyLights'];
    currentSliderValue = fairyLights.toDouble();
    print('the slider is $fairyLights');

  }
  Future sendData(int fairyLights) async {
    //http put
    Response response = await put(
      Uri.parse('http://192.168.8.202/fairylights'),
      headers: <String, String>{
        "content-type" : "application/json", "accept" : "application/json",
      },
      body: jsonEncode(<String, String>{
        'fairyLights': fairyLights.toString(),
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }

  @override
  void initState() {
    super.initState();
    print('init state');
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SmartHome'),
        backgroundColor: Colors.teal[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          // TODO: change image brightness with slider
          Image.asset('assets/ic_light2.png',scale: 0.7),
          SizedBox(height: 20),
          Text('$fairyLights'+'%',style: TextStyle(fontSize:30,fontFamily:'PermanentMarker')),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 40),
            child: Slider(
                value: currentSliderValue,
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;

                  });
                },
                onChangeEnd: (double value) {
                  setState(() {
                    fairyLights = currentSliderValue.toInt();
                    sendData(fairyLights);
                  });
                }
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {setState(() {fairyLights=1;currentSliderValue =1;sendData(fairyLights);});}, child: Text('Low',style: TextStyle(fontSize: 30,color: Colors.amber[300]),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
              TextButton(onPressed: () {setState(() {fairyLights=5;currentSliderValue =5;sendData(fairyLights);});}, child: Text('Med',style: TextStyle(fontSize: 30,color: Colors.amber[400]),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
              TextButton(onPressed: () {setState(() {fairyLights=50;currentSliderValue =50;sendData(fairyLights);});}, child: Text('High',style: TextStyle(fontSize: 30,color: Colors.amber),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
            ],
          ),
        ],

      ),

    );
  }
}