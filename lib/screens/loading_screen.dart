

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

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
    getLocationData();
  }

  getLocationData()async{
  Location location = Location();
  await location.getLocation();
  latitude = location.latitude;
  longitude = location.longitude;

  NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=8b6f94efc814be5265ce14169cfb49d9");
  
  

    var getWeatherData = await networkHelper.getData();
  
  }
  

//  Navigator.push(context, MaterialPageRoute(builder: (context)=>
// LocationScreen()
//  ));
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
