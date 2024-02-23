import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

Map<String, int> createMapWithSHA1() {
  var map = <String, int>{};
  for (var i = 1; i <= 222; i++) {
    var hash = sha1.convert(utf8.encode(i.toString())).toString();
    print(hash);
    map[hash] = i;
  }
  return map;
}

void renameFileWithPreservedExtension(File file, String newName) {
  if (file.existsSync()) {
    var newPath = '${file.parent.path}/$newName.${file.path.split('.').last}';
    file.renameSync(newPath);
    // print('File renamed to: $newPath');
  } else {
    print('File does not exist.');
  }
}
