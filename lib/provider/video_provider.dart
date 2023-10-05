import 'package:flutter/material.dart';
import 'package:songer/song.dart';

class VideoProvider extends ChangeNotifier{
  List<String> videotag = videoTag;
  String search = 'landscap';

  void selectVideoTag(int index){
    search = videotag[index];
    notifyListeners();
  }  
}