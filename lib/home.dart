import 'package:flutter/material.dart';
import 'audioclip.dart';
import 'api.dart' as api;
import 'main_appbar.dart';
import 'audioclip_list_future_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Iterable<NGinxJsonFileListItem>> audioclips;

  @override
  void initState(){
    super.initState();
    audioclips = api.getAudioClips();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MainAppBar(context),
      body: Center(child: AudioClipListFutureHandler(audioclips))
    );
  }
}

