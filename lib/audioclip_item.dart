import 'package:flutter/material.dart';
import 'package:nacholab_soundboard/audioclip.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class AudioClipItem extends StatefulWidget{
  const AudioClipItem(this.audioClip, {super.key});
  final NGinxJsonFileListItem audioClip;

  @override
  State<StatefulWidget> createState() => _AudioClipItemState();
}

class _AudioClipItemState extends State<AudioClipItem>{
  static const int PLAYBACK_STATUS_IDLE = 0;
  static const int PLAYBACK_STATUS_LOADING = 1;
  static const int PLAYBACK_STATUS_PLAYING = 2;

  NGinxJsonFileListItem audioClip = const NGinxJsonFileListItem(fileName: "", fileType: "");
  int playbackStatus = PLAYBACK_STATUS_IDLE;
  AudioPlayer? audioPlayer;

  @override
  void initState(){
    super.initState();
    playbackStatus = PLAYBACK_STATUS_IDLE;
    audioClip = widget.audioClip;
  }

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.deepPurpleAccent,
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () { play(audioClip.fileName); },  
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: switch (playbackStatus){
              PLAYBACK_STATUS_IDLE => Text(
                parseFileName(audioClip.fileName),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              PLAYBACK_STATUS_LOADING => const CircularProgressIndicator(),
              PLAYBACK_STATUS_PLAYING => Container(
                padding: const EdgeInsets.all(25),
                child: LottieBuilder.asset('animations/playing_animation.json')
              ),
              int() => const Text("Error")
            }
          )
        )
      )
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
    switch (playbackStatus){
      case PLAYBACK_STATUS_IDLE:{
        setPlaybackStatus(PLAYBACK_STATUS_LOADING);

        var audioURL = "https://audioclips.nacholab.net/audioclips/${fileName}";
        audioPlayer?.stop();
        audioPlayer?.release();
        audioPlayer = AudioPlayer();

        audioPlayer?.onPlayerStateChanged.listen((it) => setPlaybackStatus(
          switch(it){
            PlayerState.stopped => PLAYBACK_STATUS_IDLE,
            PlayerState.playing => PLAYBACK_STATUS_PLAYING,
            PlayerState.paused => PLAYBACK_STATUS_IDLE,
            PlayerState.completed => PLAYBACK_STATUS_IDLE,
            PlayerState.disposed => PLAYBACK_STATUS_IDLE,
          }
        ));

        audioPlayer?.onPlayerComplete.listen((event) { setPlaybackStatus(PLAYBACK_STATUS_IDLE); });

        await audioPlayer?.play(UrlSource(audioURL));
      }
      case PLAYBACK_STATUS_PLAYING:{
        audioPlayer?.stop();
        audioPlayer?.release();
        setPlaybackStatus(PLAYBACK_STATUS_IDLE);
      }
    }
  }

  void setPlaybackStatus(int status){
    setState(() { playbackStatus = status; });
  }
}