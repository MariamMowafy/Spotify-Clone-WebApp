import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:gap/gap.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            title: "Home",
            iconData: Icons.home,
            onTap: () {},
          ),
          _SideMenuIconTab(
            title: "Search",
            iconData: Icons.search,
            onTap: () {},
          ),
          _SideMenuIconTab(
            title: "Library",
            iconData: Icons.library_music,
            onTap: () {},
          ),
          Gap(12),
          LibraryPlaylists(),
        ],
      ),
    );
  }
}

class LibraryPlaylists extends StatefulWidget {
  const LibraryPlaylists({Key? key}) : super(key: key);

  @override
  State<LibraryPlaylists> createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<LibraryPlaylists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 12),
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.add_box),
                    Gap(20),
                    Text(
                      "CREATE PLAYLISTS",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    Gap(20),
                    Text(
                      "Liked Songs",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              ...playlists
                  .map((e) => ListTile(
                        leading: Icon(Icons.playlist_play),
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ))
                  .toList()
            ],
          ),
          Gap(12),
          Divider(
            thickness: 3,
            indent: 21,
            endIndent: 21,
          ),
          Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //   child: Text(
              //     "YOUR LIBRARY",
              //     style: Theme.of(context).textTheme.headline4,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              ...yourLibrary
                  .map((e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ))
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
