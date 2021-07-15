

import 'package:flutter/material.dart';
import 'package:my_home/room.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget roomCard(room, BuildContext context){
  return Card(
    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              room.name,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            Image.asset('assets/ic_${room.name.toLowerCase()}.png'),
          ],
        ),
        Column(
          children: [
            TextButton(onPressed: () {},onLongPress: (){Navigator.pushNamed(context,'/fairylights');}, child: Image.asset('assets/ic_light2.png')),
            Text(room.lights['value'].toString()),
          ],
        ),
        Column(
          children: [
            TextButton(onPressed: () {},onLongPress: (){Navigator.pushNamed(context,'/acRemote');}, child: Image.asset('assets/ic_ac.png')),
            Text(room.acState['temp'].toString()),
          ],
        ),

      ],
    ),

  );
}
List<Room> rooms = [
  Room(name:'BedRoom',url: 'http://192.168.8.234'),
  Room(name:'WorkRoom',url: 'http://192.168.8.202'),
  Room(name:'LivingRoom',url: 'http://192.168.8.203'),
];


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Activity'),
        actions: <Widget>[
          IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.refresh),padding: EdgeInsets.fromLTRB(0,0,20,0),)

        ],
      ),
      body: Column(
        children:
        rooms.map((room) => roomCard(room, context)).toList(),
      ),
    );
  }
}







