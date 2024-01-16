import 'package:flutter/material.dart';
import 'package:nacholab_soundboard/audioclip.dart';
import 'package:nacholab_soundboard/audioclip_list.dart';

class AudioClipListFutureHandler extends FutureBuilder<Iterable<NGinxJsonFileListItem>>{
  AudioClipListFutureHandler(Future<Iterable<NGinxJsonFileListItem>> audioClips, {super.key}):super(
    future: audioClips,
    builder: (context, snapshot) {
      if (snapshot.hasData){
        return AudioClipList(snapshot.data);
      }else if (snapshot.hasError){
        return Text("ERROR: ${snapshot.error}");
      }

      return const CircularProgressIndicator();
    }
  );
}