import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TrackBar extends StatelessWidget {
  const TrackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            Spacer(),
            _PlayerControls(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls()
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        Gap(12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Gap(4),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12),
            ),
          ],
        ),
        Gap(12),
        IconButton(onPressed: (() {}), icon: Icon(Icons.favorite_border))
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20,
                icon: Icon(Icons.shuffle)),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20,
                icon: Icon(Icons.skip_previous_outlined)),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 34,
                icon: Icon(Icons.play_circle_outline)),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20,
                icon: Icon(Icons.skip_next_outlined)),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.only(),
                iconSize: 20,
                icon: Icon(Icons.repeat))
          ],
        ),
        Gap(4),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            Gap(8),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            Gap(8),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices_outlined),
          iconSize: 20,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
            Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.fullscreen_outlined),
              iconSize: 20,
            ),
          ],
        )
      ],
    );
  }
}
