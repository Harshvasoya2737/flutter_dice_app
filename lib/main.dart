import 'dart:math';
import 'package:flutter/material.dart';
void main() => runApp(DiceRollApp());

class DiceRollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceRollScreen(),
    );
  }
}

class DiceRollScreen extends StatefulWidget {
  @override
  _DiceRollScreenState createState() => _DiceRollScreenState();
}

class _DiceRollScreenState extends State<DiceRollScreen> {
  int dice1Value = 1;
  int dice2Value = 1;
  List<String> diceImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  void rollDice() {
    setState(() {
      dice1Value = Random().nextInt(6) + 1;
      dice2Value = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff90B1C9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dice Roll',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff1944B4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Total Amount: ${dice1Value + dice2Value}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 30,
                          spreadRadius: 1,
                        )
                      ]
                  ),

                  child: Image.asset(
                    diceImages[dice1Value - 1],
                    width: 190,
                    height: 190,

                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 30,
                          spreadRadius: 1,
                        )
                      ]
                  ),
                  child: Image.asset(
                    diceImages[dice2Value - 1],
                    width: 190,
                    height: 190,
                  ),
                ),
              ],
            ),
            SizedBox(height: 300),
            Stack(
              children: [
                InkWell(
                  onTap: rollDice,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 30,
                            spreadRadius: 1,
                          )
                        ]
                      ),
                        child: Image.asset('assets/images/Button.png'))),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 30),
                  child: InkWell(
                    onTap: rollDice,
                    child: Text(
                      "Roll Dice",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
