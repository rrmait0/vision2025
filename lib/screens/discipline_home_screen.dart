import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../reusable_widgets/reusable_widgets.dart';


class DisciplineHomeScreen extends StatefulWidget {
  final int indexValue;
  const DisciplineHomeScreen({
    Key? key,
    required this.indexValue,
  }) : super(key: key);

  @override
  State<DisciplineHomeScreen> createState() => _DisciplineHomeScreenState();
}

class _DisciplineHomeScreenState extends State<DisciplineHomeScreen> {
  final List<YoutubePlayerController> _controllers = [
    'r7388BaUvfo',
    'csx7BtT73D8',
    'YB5fNGD1PqY',
    'eIGjF2T2MJo',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    ),
  )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLoggedIn(context),
      body: ListView.separated(
        itemBuilder: (context, index) {
      return YoutubePlayer(
        key: ObjectKey(_controllers[index]),
        controller: _controllers[index],
        actionsPadding: const EdgeInsets.only(left: 16.0),
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(isExpanded: true),
          const SizedBox(width: 10.0),
          RemainingDuration(),
          FullScreenButton(),
        ],
      );
    },
    itemCount: _controllers.length,
    separatorBuilder: (context, _) => const SizedBox(height: 10.0),
    ),
    );
  }
}
