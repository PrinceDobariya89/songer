import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:songer/models/spoty.dart';

class Spotify {
  static Future<Spoty> getData() async {
    final responce = await http.get(
        Uri.parse('https://api.spotify.com/v1/browse/new-releases?country=in'),
        headers: {
          'Authorization':
              'Bearer BQCXb32iy596c76TIpFUp4R53TuZmgbx6E7nYlat9FAuHgNWZBsG4zSvf6FvwoxqxgK_rLSFNSgRjk2h09cGdzBnY_GT0oSM0rhTCydsqgO1S2RQ8IIn4S0nb8f2OjZXXoqLk0wvXtSLm6e1AF4827W20O190lPqM7L0wnX9fDOqajE-5HyVMdV_A4UPz0glyw0mcW4IJgP-nvWdg-LmAQqZL3K_DhpWNZZLvPdyYEPJR-sxY29hW29I6tZU-x95R4EWyKCPs-V0LA'
        });
    if (responce.statusCode == 200) {
      return Spoty.fromJson(jsonDecode(responce.body));
    } else {
      return Spoty.fromJson(jsonDecode(responce.body));
    }
  }
}
