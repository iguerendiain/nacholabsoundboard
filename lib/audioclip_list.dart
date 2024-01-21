import 'package:flutter/material.dart';
import 'package:nacholab_soundboard/audioclip.dart';
import 'package:nacholab_soundboard/audioclip_item.dart';

class AudioClipList extends StatelessWidget{
  const AudioClipList(this.audioClips, {super.key});

  final Iterable<NGinxJsonFileListItem>? audioClips;

  @override
  Widget build(BuildContext context){
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: audioClips
        ?.map((clip) => AudioClipItem(clip)).toList() as List<Widget>
    );
  }
}