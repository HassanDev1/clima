import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
 
}
 
class _LoadingScreenState extends State<LoadingScreen> {
  
    @override
  void initState() {
   
    super.initState();
    getLocationData();
  }

  void getLocationData()async{
    WeatherModel weatherModel = WeatherModel();
    var getWeatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    LocationScreen(locationWeather: getWeatherData)
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