import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/playlist_screen.dart';
import 'package:flutter_spotify_ui/widgets/side_menu.dart';
import 'package:flutter_spotify_ui/widgets/track_bar.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 800) SideMenu(),
              Expanded(child: PlaylistScreen(playlist: lofihiphopPlaylist))
            ],
          )),
          TrackBar()
        ],
      ),
    );
  }
}
