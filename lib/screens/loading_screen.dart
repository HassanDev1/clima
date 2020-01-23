import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const String apiKey = "8b6f94efc814be5265ce14169cfb49d9";
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
  Location location = Location();
  await location.getLocation();

   
  NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial");
    
    var getWeatherData = await networkHelper.getData();
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