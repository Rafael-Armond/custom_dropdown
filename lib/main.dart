import 'package:custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, right: 32, left: 32),
              child: CustomDropdown(
                text: "Call to Action!",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 32, left: 32),
              child: CustomDropdown(
                text: "Call to Action!",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 32, left: 32),
              child: CustomDropdown(
                text: "Call to Action!",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 32, left: 32),
              child: CustomDropdown(
                text: "Call to Action!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
