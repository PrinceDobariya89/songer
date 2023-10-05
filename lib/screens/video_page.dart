import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songer/provider/video_provider.dart';
import 'package:songer/screens/video_screen.dart';
import 'package:songer/services/video_service.dart';
import 'package:songer/song.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoProvider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: VideoApi.getVideo(provider.search),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                centerTitle: true,
                backgroundColor: Colors.black,
                title: const Text(
                  'Videos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                actions: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.search),
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
                            provider.selectVideoTag(index);                           
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
              SliverList.builder(
                  itemCount: snapshot.data?.perPage,
                  itemBuilder: (context, index) {
                    String? imageUrl = snapshot.data?.videos?[index].image;
                    String? videoUrl =
                        snapshot.data?.videos?[index].videoFiles?[0].link;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                videoUrl: videoUrl ?? '',
                              ),
                            ));
                      },
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle),
                          child: Image(image: NetworkImage(imageUrl!))),
                    );
                  })
            ],
          );
        },
      ),
    );
  }
}