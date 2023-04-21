import 'package:flutter/material.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
   late AnimationController _controller;
   Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this
    );
    final curve = CurvedAnimation(parent: _controller, curve: Curves.bounceIn,reverseCurve: Curves.easeOut);
    animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(curve);
    _controller.addListener(() {
      setState(() {

      });
    });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation!.value,
        child: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 120,
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/food.jpg'),
              backgroundColor: Colors.greenAccent,
              radius: 110,
            ),
          ),
        ),
      ),
    );
  }
}
