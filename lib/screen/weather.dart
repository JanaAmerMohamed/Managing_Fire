import 'package:flutter/material.dart';
import 'package:fluttermap/client/client.dart';
import 'package:fluttermap/drawer.dart';
import 'package:fluttermap/model/model.dart';

class weather extends StatefulWidget {


  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  WeatherModel ? weatherModel;
  List<Widget> ? Hourly_cast;
  List<dynamic> ? hourly_temp;
  List<dynamic> ? hourly_date;
  List<Widget> ? Hourly_cast_time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        appBar: AppBar(
    backgroundColor: Color(0xFF931F1D),
    title: Text('ForeCast',style: TextStyle(fontSize: 30,color: Colors.white),),
    centerTitle: true,


    ),
      drawer: Drawer1(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Current Weather', style: TextStyle(color: Colors.black87,fontSize: 38, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Icon(Icons.sunny,color: Colors.amber,size: 64,),
                SizedBox(height: 20,),
                Text('${weatherModel?.currentweather["temperature"!=null? weatherModel?.currentweather["temperature"]:0]} C', style: TextStyle(color: Colors.white,fontSize: 32, fontWeight: FontWeight.bold),),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF12355B),
                      shape: StadiumBorder(),

                    ),
                    onPressed: () async{
                  weatherModel= await api().request();
                  hourly_temp=weatherModel?.hourly["temperature_2m"];
                  hourly_date=weatherModel?.hourly["time"];
                  Hourly_cast=hourly_temp?.map((e)=>Padding(padding: EdgeInsets.only(top: 10, bottom: 10, left: 160),child: Text("$e C",style: TextStyle(color: Color(0xFF12355B),fontSize: 20,fontWeight: FontWeight.bold)),)).toList();
                  Hourly_cast_time=hourly_date?.map((e)=>Padding(padding: EdgeInsets.only(top: 10, bottom: 10),child: Text("$e",style: TextStyle(color: Color(0xFF12355B),fontSize: 20,fontWeight: FontWeight.bold )),)).toList();
                  setState(() {

                  });
                }, child: Text('Get Data',style: TextStyle(fontSize: 20, color: Colors.white),)),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.white54,
                  child: Row(
                    children: [
                      Column(
                        children: Hourly_cast_time== null ? [Text("Empty")]:Hourly_cast_time!,

                      ),
                      Column(
                        children: Hourly_cast== null ? [Text("Empty")]:Hourly_cast!,

                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
