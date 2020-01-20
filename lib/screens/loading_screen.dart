
import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
 
}
 
class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
    @override
  void initState() {
   
    super.initState();
    getData();
  }

  getData()async{
  Location location = Location();
  await location.getLocation();
  latitude = location.latitude;
  longitude = location.longitude;
  print(latitude);
  print(longitude);

  Response response = await get("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=8b6f94efc814be5265ce14169cfb49d9");  
  print(jsonDecode(response.body));

 Navigator.push(context, MaterialPageRoute(builder: (context)=>
LocationScreen()
 ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child:SpinKitThreeBounce(
         color:Colors.red,
         size:100.0
       )
      ),
    );
  }
}
