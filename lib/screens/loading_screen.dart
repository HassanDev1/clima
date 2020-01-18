import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
 
class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async{
     print("button clicked before await");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("button clicked after");
    print(position);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
           
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
