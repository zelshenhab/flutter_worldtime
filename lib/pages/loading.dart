// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_worldtime/classes/getdata-class.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry =
        AllCountries(countryName: "Egypt", flag: "egypt", link: "Africa/Cairo");
    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(255, 25, 27, 75),
              size: 120.0,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     getData();
            //   },
            //   style: ButtonStyle(
            //     backgroundColor:
            //         MaterialStateProperty.all(Color.fromARGB(255, 52, 55, 157)),
            //     padding: MaterialStateProperty.all(EdgeInsets.all(12)),
            //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10))),
            //   ),
            //   child: Text(
            //     "Go To Home Screen",
            //     style: TextStyle(fontSize: 19),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
