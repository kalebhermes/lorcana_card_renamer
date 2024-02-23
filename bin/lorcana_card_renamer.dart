import 'dart:io';

import 'package:lorcana_card_renamer/lorcana_card_renamer.dart';

void main() {
  var folderPath =
      '/Users/khermes/Desktop/card_images'; // Change this to your folder path

  var directory = Directory(folderPath);
  if (!directory.existsSync()) {
    print('Directory does not exist.');
    return;
  }

  final sha1Map = createMapWithSHA1();

  var files = directory.listSync();
  for (var entity in files) {
    if (entity is File) {
      var fileName = entity.path.split('/').last.split('.').first;
      print(fileName);
      final newFileName = sha1Map[fileName];
      if (newFileName == null) {
        print('$fileName did not have a match, skipping');
      } else {
        print('Renaming file: $fileName to $newFileName');
        renameFileWithPreservedExtension(
          entity,
          newFileName.toString(),
        );
      }
    }
  }
}
