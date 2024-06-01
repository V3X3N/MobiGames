import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ReactionTime());
}

class ReactionTime extends StatefulWidget {
  const ReactionTime({Key? key}) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  List<Color> lightColors = List<Color>.filled(5, Colors.red);
  bool allGreen = false;
  bool reactionStarted = false;
  Timer? reactionTimer;
  int reactionTime = 0;
  int displayedTime = 0;
  final Random random = Random();

  void startGame() {
    setState(() {
      allGreen = false;
      reactionStarted = false;
      reactionTime = 0;
      displayedTime = 0;
      lightColors = List<Color>.filled(5, Colors.red);
    });

    Future.delayed(Duration(seconds: 1), () {
      changeLights(0);
    });
  }

  void changeLights(int index) {
    if (index < lightColors.length) {
      setState(() {
        lightColors[index] = Colors.green;
      });

      int delay = random.nextInt(2) + 1;
      Future.delayed(Duration(seconds: delay), () {
        changeLights(index + 1);
      });
    } else {
      setState(() {
        allGreen = true;
        startReactionTimer();
      });
    }
  }

  void startReactionTimer() {
    setState(() {
      reactionStarted = true;
    });

    reactionTimer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        reactionTime += 10;
      });
    });
  }

  void stopReactionTimer() {
    if (reactionTimer != null) {
      reactionTimer!.cancel();
    }
    setState(() {
      reactionStarted = false;
      displayedTime = reactionTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reaction Time Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: lightColors.map((color) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    width: 50,
                    height: 50,
                    color: color,
                  );
                }).toList(),
              ),
              SizedBox(height: 50),
              Text(
                displayedTime > 0
                    ? '${displayedTime / 1000.0}s'
                    : (reactionStarted
                        ? '${reactionTime / 1000.0}s'
                        : 'Press Start'),
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: startGame,
                child: Text('Start'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: allGreen ? stopReactionTimer : null,
                child: Text('Stop'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
