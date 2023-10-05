import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:songer/models/video.dart';

class VideoApi{
  static String baseUrl = 'https://api.pexels.com/videos/search?query=';
  static Map<String,String> auth = {'Authorization':'PYv0vOm5Yjq8ud6kshclFMpnTPH0BDfclsb21eFHaCSA9ADhOddasmsc'};
  static Future<Video> getVideo(String query) async{
    var responce = await http.get(Uri.parse(baseUrl+query),headers: auth);
    if(responce.statusCode == 200){
      return Video.fromJson(jsonDecode(responce.body));
    }else{
      return Video.fromJson(jsonDecode(responce.body));
    }
  }
}