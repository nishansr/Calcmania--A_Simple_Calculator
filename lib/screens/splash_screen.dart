import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/calc.png',
      ),
    );
  }
}
