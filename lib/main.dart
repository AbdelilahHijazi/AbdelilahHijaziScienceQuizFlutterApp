import 'package:flutter/material.dart';
import './QuizPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abdelilah Hijazi Science Quiz',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/home_screen.jpg"), fit: BoxFit.fill)),
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, //background color of button
              side: BorderSide(
                width: 5,
                color: Color.fromARGB(229, 40, 118, 229),
              ), //border width and color
              elevation: 5, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              minimumSize: Size(400, 50) //content padding inside button
              ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuizPage(),
            ));
          },
          child: Text(
            textAlign: TextAlign.center,
            'Start Abdelilah Hijazi Science Quiz',
            style: TextStyle(
              fontFamily: "Prompt",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(229, 40, 118, 229),
            ),
          ),
        ),
      ),
    );
  }
}
