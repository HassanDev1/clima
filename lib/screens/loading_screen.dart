
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
 
double latitude;
double longitude;
 
class _LoadingScreenState extends State<LoadingScreen> {
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

  Response response = await get("https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22");  
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
