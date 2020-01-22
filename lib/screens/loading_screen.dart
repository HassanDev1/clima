

import 'package:clima/services/location.dart';
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
    getData();
  }

  getData()async{
  Location location = Location();
  await location.getLocation();
  latitude = location.latitude;
  longitude = location.longitude;
  print(latitude);
  print(longitude);

  

    double temperature = decodedData['main']['temp'];
    int condition = decodedData['weather'][0]['id'];
    String cityName = decodedData['name'];

    print(temperature);
    print(condition);
    print(cityName);
  }
  

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
