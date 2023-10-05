import 'package:songer/models/category.dart';

class CategoryOperations {
  static List<Category> getCategories() {
    return <Category>[
      Category(
          'Liked Songs',
          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/90/9d/aa/909daa9a-3a47-9314-2855-39f5a157f1e3/5054197407734.jpg/592x592bb.webp',
          'https://p.scdn.co/mp3-preview/23b1dea433ff381db634780c30c2c14e81dcb368?cid=6306cba84496476fbf4b84f0d7f38704'),
      Category(
          'Pepas',
          'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/66/bd/86/66bd86b2-3dc4-0cbd-d47e-00cc863dd7c4/886449370535.jpg/592x592bb.webp',
          'https://p.scdn.co/mp3-preview/5c8c5231969e5d6952f54347aa00a6569a82d4b9?cid=6306cba84496476fbf4b84f0d7f38704'),
      Category(
        'Pathan',
        'https://img.wynk.in/unsafe/248x248/filters:no_upscale():strip_exif():format(webp)/http://s3.ap-south-1.amazonaws.com/wynk-music-cms/srch_unisysinfo/2022-12/22/06-36/Pathaan.jpg',
        'https://p.scdn.co/mp3-preview/e422e47f810e668edb1ee37105f05848231264af?cid=6306cba84496476fbf4b84f0d7f38704',
      ),
      Category('Vele',
          'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/fe/27/2f/fe272f90-3bf9-b6e3-ffba-7068e9958c9c/886443601017.jpg/592x592bb.webp',
          'https://p.scdn.co/mp3-preview/7f5642655b0b22bb97c9863fdbe26656d2357c5a?cid=6306cba84496476fbf4b84f0d7f38704'),
      Category('Maan Meri Jaan',
          'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/90/9d/aa/909daa9a-3a47-9314-2855-39f5a157f1e3/5054197407734.jpg/592x592bb.webp',
          'https://p.scdn.co/mp3-preview/615d8699b9be2363bd0ad31a19a43846c63bd99f?cid=6306cba84496476fbf4b84f0d7f38704'),
      Category('Pathan',
          'https://img.wynk.in/unsafe/248x248/filters:no_upscale():strip_exif():format(webp)/http://s3.ap-south-1.amazonaws.com/wynk-music-cms/srch_unisysinfo/2022-12/22/06-36/Pathaan.jpg',
          'https://p.scdn.co/mp3-preview/bad1c1c9b557a1f19ba61a57f9e55ceb4d8efcfc?cid=6306cba84496476fbf4b84f0d7f38704'
          ),
    ];
  }
}
