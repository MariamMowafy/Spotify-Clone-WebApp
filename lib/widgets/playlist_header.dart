import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:gap/gap.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Gap(16),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PUBLIC PLAYLIST',
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12),
                ),
                Gap(12),
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Gap(16),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Gap(16),
                Text(
                  "Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration} ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ))
          ],
        ),
        Gap(20),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle_filled,
              color: Colors.greenAccent[400],
              size: 50,
            )),
        Gap(21),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
          ),
        ),
        Gap(4),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.download_for_offline_outlined),
            iconSize: 30,
          ),
        ),
        Gap(4),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            iconSize: 30,
          ),
        ),
        Spacer(),
        Text(
          "FOLLOWERS\n$followers",
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
