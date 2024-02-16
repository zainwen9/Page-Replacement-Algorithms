import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';

import 'AnimatedButtons.dart'; // Import for animations

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin { // Add with SingleTickerProviderStateMixin

  late AnimationController _controller; // AnimationController variable

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Set the duration for one complete rotation
    );

    _controller.repeat(); // Repeat the animation continuously

    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ButtonView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Replacement Algorithms',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition( // Use RotationTransition for continuous rotation
              turns: _controller, // Assign the animation controller
              child: Container(
                height: 150,
                width: 150,
                color: Colors.transparent,
                child: Image.asset('assets/cs.png'),
              ),
            ),
            const SizedBox(height: 50,),
            // Rest of your content


            Text('Developed By:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
            const SizedBox(height: 100,),
            Text('@zain_dev_',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45),),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }
}


