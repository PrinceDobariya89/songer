import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  @override
  Widget build(BuildContext context) {
       return const SafeArea(
        child:Center(
        child: Text('You Library',style: TextStyle(
    fontSize: 25,color: Colors.white),
    ),
      ),
      );
  }
}