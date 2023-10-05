import '../models/music.dart';

class MusicOperation{
  MusicOperation._(){}
  static List<Music> getMusic(){
    return <Music>[
      Music('Jhoome Jo Pathan',
          'https://img.wynk.in/unsafe/248x248/filters:no_upscale():strip_exif():format(webp)/http://s3.ap-south-1.amazonaws.com/wynk-music-cms/srch_unisysinfo/2022-12/22/06-36/Pathaan.jpg',
          'Pathan',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/0f/ef/0e/0fef0e8c-7908-1a5f-f166-7506ed2a43a1/mzaf_4776435560797007278.plus.aac.p.m4a'),
      Music('Pepas',
          'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/66/bd/86/66bd86b2-3dc4-0cbd-d47e-00cc863dd7c4/886449370535.jpg/592x592bb.webp',
          'Pepas',
          'https://firebasestorage.googleapis.com/v0/b/turnament-hub-4532f.appspot.com/o/song%2FPepas.m4a?alt=media&token=0b669ba2-5885-4167-8cd4-411456ba65d1'),
      Music('Vele',
          'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/fe/27/2f/fe272f90-3bf9-b6e3-ffba-7068e9958c9c/886443601017.jpg/592x592bb.webp',
          'Student of the Year',
          'https://firebasestorage.googleapis.com/v0/b/turnament-hub-4532f.appspot.com/o/song%2FVele%20-%20Vishal%20%26%20Shekhar%2C%20Vishal%20Dadlani%2C%20Shekhar%20Ravjiani.m4a?alt=media&token=0fc0554a-b5c1-490f-9654-c21c964d9bda'),
      Music('Maan Meri Jaan',
          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/90/9d/aa/909daa9a-3a47-9314-2855-39f5a157f1e3/5054197407734.jpg/592x592bb.webp',
          'King',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/17/f6/28/17f62889-6e7b-d99f-d7d1-480a9cd1f843/mzaf_18401053133753953891.plus.aac.p.m4a'),
      Music('Besharam Rang',
          'https://img.wynk.in/unsafe/248x248/filters:no_upscale():strip_exif():format(webp)/http://s3.ap-south-1.amazonaws.com/wynk-music-cms/srch_unisysinfo/2022-12/22/06-36/Pathaan.jpg',
          'pathan',
          'https://firebasestorage.googleapis.com/v0/b/turnament-hub-4532f.appspot.com/o/song%2FBesharam%20Rang%20Song%20_%20Pathaan%20_%20Shah%20Rukh%20Khan%2C%20Deepika%20Padukone%20_%20Vishal%20.mp3?alt=media&token=52f70d77-c76a-42c6-8fe3-106e4ac541eb'),
      Music('Apna Bna Le',
          'https://www.ilyricshub.com/wp-content/uploads/2022/11/apna-bana-le-bhediya.jpg',
          'Bhediya',
          'https://firebasestorage.googleapis.com/v0/b/turnament-hub-4532f.appspot.com/o/song%2FApna%20Bana%20Le%20-%20Arijit%20Singh%2C%20Sachin-Jigar.m4a?alt=media&token=0f2d296d-5233-4dc1-8134-e483c243c9bf'),
    ];
  }
}