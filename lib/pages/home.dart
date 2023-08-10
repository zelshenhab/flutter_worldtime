// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    String bgimg = data["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bgimg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if (result == null) {
                      data = {
                        "time": "",
                        "location": "Please Choose a Location",
                        "isDayTime": false
                      };
                    } else {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"],
                      };
                    }
                    // data = {
                    //   "time": result["time"],
                    //   "location": result["location"],
                    //   "isDayTime": result["isDayTime"],
                    // };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                width: double.infinity,
                color: Color.fromARGB(110, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
