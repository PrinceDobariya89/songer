import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:songer/models/music.dart';
import 'package:songer/screens/home.dart';
import 'package:songer/screens/video_page.dart';
import 'package:songer/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  var tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;

  Music? music;
  Widget miniPlayer(Music? music,{bool stop=false}){
    this.music = music;

    if(music==null){
      return const SizedBox();
    }
    if(stop){
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
    color: Colors.blueGrey,
      width: deviceSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 200,
            child: Marquee(
              text: music.name,
              style: const TextStyle(
                  color: Colors.white,
              ),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            showFadingOnlyWhenScrolling: true,
            blankSpace: 0.0,
            velocity: 50.0,
            startAfter: Duration.zero,
            pauseAfterRound: const Duration(seconds: 3),
            accelerationDuration: Duration.zero,
            accelerationCurve: Curves.decelerate,
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            // Text(music.name,style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(onPressed: ()async{
            isPlaying = !isPlaying;
            if(isPlaying){
              await _audioPlayer.play(UrlSource(music.audioURL));
            }else{
              await _audioPlayer.pause();
            }
            setState(() {
              
            });
          }, icon: isPlaying
              ? const Icon(Icons.pause,color: Colors.white)
              : const Icon(Icons.play_arrow,color: Colors.white),
          ),
        ],
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    tabs = [Home(miniPlayer),const VideoPage(),const YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex){
              currentTabIndex = currentIndex;
              setState(() {
              });
            },
            selectedLabelStyle: const TextStyle(color: Colors.white),
            selectedItemColor: Colors.white,
            backgroundColor: const Color(0x00ffffff),
            elevation: 0,
            items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection,color: Colors.white,),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books,color: Colors.white,),
              label: 'Your Library'
            ),
          ],
        ),
        ],
      ),
    );
  }
}
