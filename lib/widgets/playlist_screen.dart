import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/playlist_header.dart';
import 'package:flutter_spotify_ui/widgets/trackslist.dart';
import 'package:gap/gap.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        actions: [
          if (MediaQuery.of(context).size.width > 600)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[900]?.withOpacity(0.4)),
              child: Row(
                children: [
                  Gap(8),
                  TextButton.icon(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).iconTheme.color),
                      onPressed: () {},
                      icon: Icon(
                        Icons.account_circle_outlined,
                        size: 25,
                      ),
                      label: Text(
                        'Mariam Mowafy',
                        style: TextStyle(fontSize: 14),
                      )),
                  Gap(8),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          Gap(75),
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28,
                  ),
                ),
              ),
              Gap(16),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color(0x3cba7b),
                Theme.of(context).backgroundColor
              ],
                  stops: [
                0,
                0.3
              ])),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs)
            ],
          )),
    );
  }
}
