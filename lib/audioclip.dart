class NGinxJsonFileListItem{
  final String fileName;
  final String fileType;
  // final DateTime modifiedTime;
  // final BigInt size;

  const NGinxJsonFileListItem({
    required this.fileName,
    required this.fileType,
    // required this.modifiedTime,
    // required this.size
  });


  factory NGinxJsonFileListItem.fromJson(Map<String, dynamic> json){
    return switch (json) {
      {
        'name': String fileName,
        'type': String fileType,
        // 'mtime': DateTime modifiedTime,
        // 'size': BigInt size
      } => NGinxJsonFileListItem(
        fileName: fileName,
        fileType: fileType,
        // modifiedTime: modifiedTime,
        // size: size
      ),
      _ => throw const FormatException("Error while parsing NGInx JSON directory listing item"),
    };
  }
}