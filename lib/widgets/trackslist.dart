import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;
  const TracksList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 54,
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
      showCheckboxColumn: false,
      columns: [
        DataColumn(label: Text('#')),
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = TextStyle(
            color: selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).iconTheme.color);
        return DataRow(
          cells: [
            DataCell(Text(
              e.id,
              style: textStyle,
            )),
            DataCell(Text(
              e.title,
              style: textStyle,
            )),
            DataCell(Text(
              e.artist,
              style: textStyle,
            )),
            DataCell(Text(
              e.album,
              style: textStyle,
            )),
            DataCell(Text(
              e.duration,
              style: textStyle,
            ))
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}
