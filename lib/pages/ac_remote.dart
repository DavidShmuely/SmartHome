import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class AC extends StatefulWidget {
  @override
  _ACState createState() => _ACState();
}

class _ACState extends State<AC> {
  // TODO: try to use this Map instead al of the variables
  // Map acState = {'isON':false,'isHeat':false,'degrees': 16,'fan': 1};
  int degrees = 16;
  bool isHeat = false;
  bool isOn = false;
  int fanLevel = 1;
  var fanText = 'Low';
  //json send function
  String url = 'http://192.168.8.234/state';

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
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(isOn?'ON':'OFF',style: TextStyle(fontFamily: 'IndieFlower',fontSize: 35)),
                    TextButton(onPressed: () {setState(() {isOn = !isOn; });}, child: Image.asset('assets/ic_power.png')),
                    TextButton(onPressed: () {degrees<30? setState(() {degrees+=1;   }):null;}, child: Image.asset('assets/ic_deg_up.png')),
                    TextButton(onPressed: () {degrees>16? setState(() {degrees-=1;   }):null;}, child: Image.asset('assets/ic_deg_down.png')),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 3.0 , color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('$degrees',style: TextStyle(color: isOn? Colors.black:Colors.grey,fontFamily: 'IndieFlower',fontSize: 80)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Heat  ', style: TextStyle(color: isOn&&isHeat? Colors.amber:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
                          Text('Cool', style: TextStyle(color: isOn&&!isHeat? Colors.blue:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Fan:  ', style: TextStyle(color: isOn? Colors.green:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
                          Text('$fanText', style: TextStyle(color: isOn? Colors.green:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
                        ],
                      ),
                    ],
                  ),


                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {setState(() {isHeat = true; });}, child: Image.asset('assets/ic_heat.png',scale: 1.2)),
              TextButton(onPressed: () {setState(() {isHeat = false; });}, child: Image.asset('assets/ic_cool.png',scale: 1.2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start  ,

            children: [
              TextButton(onPressed: () {setState(() {fanText='Low';fanLevel=1;});}, child: Image.asset('assets/ic_fan1.png',scale: 1.2)),
              TextButton(onPressed: () {setState(() {fanText='Med';fanLevel=2;});}, child: Image.asset('assets/ic_fan2.png',scale: 1.2)),
              TextButton(onPressed: () {setState(() {fanText='High';fanLevel=3;});}, child: Image.asset('assets/ic_fan3.png',scale: 1.2)),
              TextButton(onPressed: () {setState(() {fanText='Auto';fanLevel=0;});}, child: Image.asset('assets/ic_fan_auto.png',scale: 1.2)),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

}
