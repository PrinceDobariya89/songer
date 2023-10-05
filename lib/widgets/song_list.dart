import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          title: const Text('Chaleya'),
          subtitle: const Text('artist'),
          leading: const Image(
              image: NetworkImage(
                  'https://c.saavncdn.com/026/Chaleya-From-Jawan-Hindi-2023-20230814014337-500x500.jpg')),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        );
      },
    );
  }
}
