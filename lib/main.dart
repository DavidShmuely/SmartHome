import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_home/pages/fairylights.dart';
import 'room.dart';
import 'package:my_home/pages/home.dart';
import 'package:my_home/pages/ac_remote.dart';
import 'package:my_home/pages/loading.dart';


void main() => runApp(MaterialApp(
    // theme: ThemeData(fontFamily: 'Permanent'),
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/acRemote': (context) => AC(),
    '/fairylights':(context) =>FairyLights(),
  },
));

//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SmartHome'),
//         backgroundColor: Colors.teal[300],
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   debugPrint(' go to workroom');
//                 },
//                 style: TextButton.styleFrom(
//                   primary: Colors.grey[300],
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(10.0),
//
//                 ),
//                 child: Image.asset('assets/ic_workroom.png'),
//               ),
//               Text('חדר עבודה'),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   debugPrint(' go to bedroom');
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => BedRoom()),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   primary: Colors.grey[300],
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(10.0),
//
//                 ),
//                 child: Image.asset('assets/ic_bedroom.png'),
//               ),
//               Text('חדר שינה'),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   debugPrint(' go to livingroom');
//                 },
//                 style: TextButton.styleFrom(
//                   primary: Colors.grey[300],
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(10.0),
//
//                 ),
//                 child: Image.asset('assets/ic_livingroom.png'),
//               ),
//               Text('סלון'),
//             ],
//           ),
//
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {  },
//         child: Text('++'),
//         backgroundColor: Colors.teal[300],
//       ),
//     );
//   }
// }


//
// class BedRoom extends StatefulWidget {
//   @override
//   _BedRoomState createState() => _BedRoomState();
// }
//
// class _BedRoomState extends State<BedRoom> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SmartHome'),
//         backgroundColor: Colors.teal[300],
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   debugPrint(' go to ac');
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => AC())
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   primary: Colors.grey[300],
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(10.0),
//
//                 ),
//                 child: Image.asset('assets/ic_ac.png'),
//               ),
//               Text('מזגן'),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   debugPrint(' go to fairylights');
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => FairyLights())
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   primary: Colors.grey[300],
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(10.0),
//
//                 ),
//                 child: Image.asset('assets/ic_fairylights.png'),
//               ),
//               Text('fairyLights'),
//             ],
//           ),
//
//         ],
//       ),
//
//     );
//   }
// }
//
// class AC extends StatefulWidget {
//   @override
//   _ACState createState() => _ACState();
// }
//
// class _ACState extends State<AC> {
//   // TODO: try to use this Map instead al of the variables
//   // Map acState = {'isON':false,'isHeat':false,'degrees': 16,'fan': 1};
//   int degrees = 16;
//   bool isHeat = false;
//   bool isOn = false;
//   int fanLevel = 1;
//   var fanText = 'Low';
//   //json send function
//   String url = 'http://192.168.8.234/state';
//
//   //
//   // Future<String> makeRequest() async {
//   //   var response = await http.put(Uri.parse(url), body: json.encode({
//   //     "NewHourMeterReading": "650",
//   //     "EquipmentNumber": "34665",
//   //     "NewFuelMeterReading": "650"
//   //   }), headers: {"content-type" : "application/json","accept" : "application/json",});
//   //
//   //   // print(response.body);
//   //
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SmartHome'),
//         backgroundColor: Colors.teal[300],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           IntrinsicHeight(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(isOn?'ON':'OFF',style: TextStyle(fontFamily: 'IndieFlower',fontSize: 35)),
//                     TextButton(onPressed: () {setState(() {isOn = !isOn; });}, child: Image.asset('assets/ic_power.png')),
//                     TextButton(onPressed: () {degrees<30? setState(() {degrees+=1;   }):null;}, child: Image.asset('assets/ic_deg_up.png')),
//                     TextButton(onPressed: () {degrees>16? setState(() {degrees-=1;   }):null;}, child: Image.asset('assets/ic_deg_down.png')),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(width: 3.0 , color: Colors.black),
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text('$degrees',style: TextStyle(color: isOn? Colors.black:Colors.grey,fontFamily: 'IndieFlower',fontSize: 80)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text('Heat  ', style: TextStyle(color: isOn&&isHeat? Colors.amber:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
//                           Text('Cool', style: TextStyle(color: isOn&&!isHeat? Colors.blue:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text('Fan:  ', style: TextStyle(color: isOn? Colors.green:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
//                           Text('$fanText', style: TextStyle(color: isOn? Colors.green:Colors.grey,fontFamily: 'IndieFlower',fontSize: 40)),
//                         ],
//                       ),
//                     ],
//                   ),
//
//
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextButton(onPressed: () {setState(() {isHeat = true; });}, child: Image.asset('assets/ic_heat.png',scale: 1.2)),
//               TextButton(onPressed: () {setState(() {isHeat = false; });}, child: Image.asset('assets/ic_cool.png',scale: 1.2)),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start  ,
//
//             children: [
//               TextButton(onPressed: () {setState(() {fanText='Low';fanLevel=1;});}, child: Image.asset('assets/ic_fan1.png',scale: 1.2)),
//               TextButton(onPressed: () {setState(() {fanText='Med';fanLevel=2;});}, child: Image.asset('assets/ic_fan2.png',scale: 1.2)),
//               TextButton(onPressed: () {setState(() {fanText='High';fanLevel=3;});}, child: Image.asset('assets/ic_fan3.png',scale: 1.2)),
//               TextButton(onPressed: () {setState(() {fanText='Auto';fanLevel=0;});}, child: Image.asset('assets/ic_fan_auto.png',scale: 1.2)),
//             ],
//           ),
//          SizedBox(height: 20,),
//         ],
//       ),
//     );
//   }
//
// }
//
// class FairyLights extends StatefulWidget {
//   @override
//   _FairyLightsState createState() => _FairyLightsState();
// }
//
// class _FairyLightsState extends State<FairyLights> {
//   double currentSliderValue = 10;
//   int fairyLights = 0;
//
//   Future<void> getData() async {
//     //http request
//     Response response = await get(Uri.parse('http://192.168.8.202/fairylights'));
//     Map data = jsonDecode(response.body);
//     print(data['fairyLights']);
//     fairyLights = data['fairyLights'];
//     currentSliderValue = fairyLights.toDouble();
//     print('the slider is $fairyLights');
//
//   }
//   Future sendData(int fairyLights) async {
//     //http put
//     Response response = await put(
//       Uri.parse('http://192.168.8.202/fairylights'),
//       headers: <String, String>{
//         "content-type" : "application/json", "accept" : "application/json",
//       },
//       body: jsonEncode(<String, String>{
//         'fairyLights': fairyLights.toString(),
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       print(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to update album.');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     print('init state');
//     getData();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text('SmartHome'),
//     backgroundColor: Colors.teal[300],
//     ),
//     body: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(height: 70,),
//         // TODO: change image brightness with slider
//         Image.asset('assets/ic_light2.png',scale: 0.7),
//         SizedBox(height: 20),
//         Text('$fairyLights'+'%',style: TextStyle(fontSize:30,fontFamily:'PermanentMarker')),
//         SizedBox(height: 60),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 40),
//           child: Slider(
//             value: currentSliderValue,
//             min: 0,
//             max: 100,
//             onChanged: (double value) {
//             setState(() {
//               currentSliderValue = value;
//
//             });
//             },
//             onChangeEnd: (double value) {
//               setState(() {
//                 fairyLights = currentSliderValue.toInt();
//                 sendData(fairyLights);
//               });
//             }
//           ),
//         ),
//         SizedBox(height: 50,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(onPressed: () {setState(() {fairyLights=1;currentSliderValue =1;sendData(fairyLights);});}, child: Text('Low',style: TextStyle(fontSize: 30,color: Colors.amber[300]),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
//             TextButton(onPressed: () {setState(() {fairyLights=5;currentSliderValue =5;sendData(fairyLights);});}, child: Text('Med',style: TextStyle(fontSize: 30,color: Colors.amber[400]),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
//             TextButton(onPressed: () {setState(() {fairyLights=50;currentSliderValue =50;sendData(fairyLights);});}, child: Text('High',style: TextStyle(fontSize: 30,color: Colors.amber),),style: ElevatedButton.styleFrom(shape: CircleBorder(),padding: EdgeInsets.all(20)),),
//           ],
//         ),
//       ],
//
//     ),
//
//     );
//   }
// }
//
// class CardsHome extends StatefulWidget {
//   @override
//   _CardsHomeState createState() => _CardsHomeState();
// }
//
// Widget roomCard(room){
//   return Card(
//     margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
//     child:
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Text(
//                   room.name,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 Image.asset('assets/ic_${room.name.toLowerCase()}.png'),
//               ],
//             ),
//             Column(
//               children: [
//                 Image.asset('assets/ic_light2.png'),
//                 Text(room.lights['value'].toString()),
//               ],
//             ),
//             Column(
//               children: [
//                 Image.asset('assets/ic_ac.png'),
//                 Text(room.acState['temp'].toString()),
//               ],
//             ),
//
//           ],
//         ),
//
//     );
// }
// List<Room> rooms = [
//   Room(name:'BedRoom',url: 'http://192.168.8.234'),
//   Room(name:'WorkRoom',url: 'http://192.168.8.202'),
//   Room(name:'LivingRoom',url: 'http://192.168.8.203'),
// ];
//
//
// class _CardsHomeState extends State<CardsHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Activity'),
//       ),
//       body: Column(
//         children:
//           rooms.map((room) => roomCard(room)).toList(),
//       ),
//     );
//   }
// }







