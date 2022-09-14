import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var num1 = 1;
  var num2 = 1;
  bool start = true;
  String? winner = "";

  void Play() {
    print('Start!');
    num1 = Random().nextInt(3) + 1;
    num2 = Random().nextInt(3) + 1;

    // paper = 1, rock = 2, sicssors = 3
    if (start) {
      winner = "";
      start = false;
    } else if ((num1 == 1 && num2 == 2) ||
        (num1 == 2 && num2 == 3) ||
        (num1 == 3 && num2 == 1)) {
      // player 1 won
      winner = "Player 1 is the  WINNER!!";
    } else if ((num2 == 1 && num1 == 2) ||
        (num2 == 2 && num1 == 3) ||
        (num2 == 3 && num1 == 1)) {
      // player 2 won
      winner = "Player 2 is the  WINNER!!";
    } else {
      // Draw
      winner = "we have a draw! :<";
    }
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 146, 246, 146),
          title: Center(
            child: Text(
              'حجرة ورقة مقص',
              style: TextStyle(color: Color.fromARGB(255, 51, 141, 54)),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '$winner',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Move_$num1.png',
                          height: 80,
                          width: 80,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('P1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Move_$num2.png',
                          height: 80,
                          width: 80,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('P2',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 146, 246, 146),
                  ),
                  onPressed: () {
                    Play();
                  },
                  child: Text(
                    'العب!',
                    style: TextStyle(color: Color.fromARGB(255, 51, 141, 54)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
