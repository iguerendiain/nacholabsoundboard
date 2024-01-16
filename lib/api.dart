import 'dart:convert';
import 'package:http/http.dart' as http;
import 'audioclip.dart';

Future<Iterable<NGinxJsonFileListItem>> getAudioClips() async {
  final response = await http.get(Uri.parse("https://audioclips.nacholab.net/audioclips/"));

  if (response.statusCode == 200){
    return List<NGinxJsonFileListItem>.from((jsonDecode(response.body) as Iterable).map((fileItemJson) =>
      NGinxJsonFileListItem.fromJson(fileItemJson)
    ));
  }else {
    throw Exception("Unexpected status code received from backend");
  }
}
