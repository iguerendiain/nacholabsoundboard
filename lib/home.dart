import 'package:flutter/material.dart';
import 'audioclip.dart';
import 'api.dart' as api;
import 'main_appbar.dart';
import 'audioclip_list_future_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

