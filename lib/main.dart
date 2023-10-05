import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songer/provider/video_provider.dart';
import 'package:songer/screens/app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => VideoProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Songer',
      home: MyApp(),
    ),
  ));
}
