import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:songer/models/category.dart';
import 'package:songer/models/music.dart';
import 'package:songer/services/category_operation.dart';
import 'package:songer/services/music_operation.dart';
import 'package:songer/song.dart';

class Home extends StatefulWidget {
  final Function _miniPlayer;
  const Home(this._miniPlayer, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  String welcome() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18 && hour >= 12) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }

  Widget createCetegory(Category category) {
    return GestureDetector(
      onTap: () {
        audioPlayer.play(UrlSource(category.songUrl));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Row(
          children: [
            Image.network(
              category.imageURL,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Text(
                  category.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList = CategoryOperations.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCetegory(category))
        .toList();

    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            width: 160,
            child: InkWell(
              onTap: () {
                widget._miniPlayer(music, stop: true);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            music.Description,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperation.getMusic();
    musicList.shuffle();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 8 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: createListOfCategories(),
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.history),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings_outlined),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(welcome(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            actions: const [
              Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.history),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings_outlined),
            ),
          ],
        ),
            ],
          ),
          SliverAppBar(
              elevation: 30,
              backgroundColor: Colors.black,
              pinned: true,
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    videoTag.length,
                    (index) => InkWell(
                      onTap: () {
                        // provider.selectVideoTag(index);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          videoTag[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade900, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  // createAppBar(welcome()),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  createGrid(),
                  createMusicList('Charts'),
                  createMusicList('Recently Played'),
                ],
              ),
            ),
          )
        ],
      ),
    );
    // return SafeArea(
    //   child: SingleChildScrollView(
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(colors: [
    //           Colors.grey.shade900,
    //           Colors.black
    //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //       ),
    //       child: Column(
    //         children: [
    //           createAppBar(welcome()),
    //           const SizedBox(
    //             height: 5,
    //           ),
    //           createGrid(),
    //           createMusicList('Charts'),
    //           createMusicList('Recently Played'),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
