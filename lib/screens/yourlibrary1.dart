import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:songer/models/spoty.dart';
import 'package:songer/services/spotify_api.dart';
import 'package:songer/song.dart';
import 'package:songer/widgets/song_list.dart';

class YourLibrary1 extends StatefulWidget {
  const YourLibrary1({Key? key}) : super(key: key);

  @override
  State<YourLibrary1> createState() => _YourLibrary1State();
}

class _YourLibrary1State extends State<YourLibrary1> {
  final player = AudioPlayer();
  AudioPlayer audioPlayer = AudioPlayer();
  IconData icon = Icons.play_arrow_rounded;
  var data;
  @override
  void initState() {
    data = Spotify.getData();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Songer'),
            actions: [
              // OutlinedButton(onPressed: () async {}, child: const Text('Login'))
            ],
            backgroundColor: Colors.transparent,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: [StretchMode.fadeTitle],
              title: Image(
                height: 100,
                width: 100,
                image: NetworkImage(
                    'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/90/9d/aa/909daa9a-3a47-9314-2855-39f5a157f1e3/5054197407734.jpg/592x592bb.webp'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: data,
              builder: (context, snapshot) {
                // if (!snapshot.hasData) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                // if (snapshot.hasError) {
                //   return Text(snapshot.data.toString());
                // }
                Spoty spoty = snapshot.data as Spoty;
                return SliverList.builder(
                  itemCount: spoty.albums?.items?.length,
                  itemBuilder: (context, index) {
                    String? url = spoty.albums?.items?[index].images?[1].url;
                    String? title = spoty.albums?.items?[index].name;
                    String? id = spoty.albums?.items?[index].id;
                    print(spoty.albums?.items?[5].id);
                    return ListTile(
                      onTap: (){
                         audioPlayer.play(UrlSource(songs[index]));
                          //             // audioPlayer.stop();
                      },
                      title: Text(title??'',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(id??'',
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(backgroundImage: NetworkImage(url!),),
                    );
                  },
                );
              },
            ),
          ),

          // const SongList()
          // FutureBuilder<Spoty>(
          //   future: data,
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.hasError) {
          //       return Text(snapshot.data.toString());
          //     }
          //     Spoty spoty = snapshot.data as Spoty;
          //     return SliverList.builder(
          //       itemCount: spoty.albums?.items?.length,
          //       itemBuilder: (context, index) {
          //         var i = spoty.albums?.items?[index];
          //         // print('${i?.artists?[0].name} == ${i?.artists?[0].id }');
          //         String? url = spoty.albums?.items?[index].images?[1].url;
          //         String? uri = spoty.albums?.items?[index].uri;
          //         String? song = i?.href;
          //         print(i?.uri);
          //         return ListTile(
          //           onTap: () {
          //             audioPlayer.play(UrlSource(dancekabhoot));
          //             // audioPlayer.stop();
          //           },
          //           title: Text(i?.name.toString()??'',style: const TextStyle(color: Colors.white,fontSize: 15),),
          //           trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.white)),
          //           leading: CircleAvatar(
          //             backgroundImage: NetworkImage(url!),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // )
        ],
      ),
    );
    //   // return SafeArea(
    //     child: Center(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //               onPressed: () async {
    //                 await player.play(UrlSource(
    //                     'https://firebasestorage.googleapis.com/v0/b/turnament-hub-4532f.appspot.com/o/song%2FApna%20Bana%20Le%20-%20Arijit%20Singh%2C%20Sachin-Jigar.m4a?alt=media'));
    //               },
    //               icon: const Icon(
    //                 Icons.play_arrow_rounded,
    //                 color: Colors.white,
    //               )),
    //           IconButton(
    //               onPressed: () {
    //                 player.pause();
    //               },
    //               icon: const Icon(
    //                 Icons.pause_rounded,
    //                 color: Colors.white,
    //               )),
    //           IconButton(
    //               onPressed: () {},
    //               icon: const Icon(
    //                 Icons.stop_rounded,
    //                 color: Colors.white,
    //               )),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
