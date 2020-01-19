
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';


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
  print(latitude);
  print(longitude);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

      ),
    );
  }
}
