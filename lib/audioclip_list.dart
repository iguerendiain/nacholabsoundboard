import 'package:flutter/material.dart';
import 'package:nacholab_soundboard/audioclip.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioClipList extends Container{
  AudioClipList(this.audioClips, {super.key});

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
        ?.map((clip) =>
          GestureDetector(
            onTap: () { play(clip.fileName); },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: Text(parseFileName(clip.fileName))
            )
          )
        ).toList() as List<Widget>
    );
  }

  String parseFileName(String fileName){
    var fileNameParts = fileName.split(".");
    fileNameParts.removeLast();
    return fileNameParts
      .join("")
      .split("_")
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(" ");
  }

  void play(String fileName) async{
    var audioURL = "https://audioclips.nacholab.net/audioclips/${fileName}";
    final player = AudioPlayer();
    await player.play(UrlSource(audioURL));
  }
}






// class AudioClipList extends GridView{
//   AudioClipList(Iterable<NGinxJsonFileListItem>? audioClips, {super.key}): super.count(
//     primary: false,
//     padding: const EdgeInsets.all(20),
//     crossAxisSpacing: 10,
//     mainAxisSpacing: 10,
//     crossAxisCount: 3,
//     // children: audioClips
//     //   ?.map((clip) =>
//     //     Container(
//     //       padding: const EdgeInsets.all(8),
//     //       color: Colors.blue,
//     //       child: Text(parseFileName(clip.fileName))
//     //       )
//     //   ).toList() as List<Widget>
//   );

//   @override
//   void initState(){
//     this.

//   }

//   String parseFileName(String fileName){
//     var fileNameParts = fileName.split(".");
//     fileNameParts.removeLast();
//     return fileNameParts
//       .map((word) => word[0].toUpperCase() + word.substring(1))
//       .join(" ");
//   }
// }