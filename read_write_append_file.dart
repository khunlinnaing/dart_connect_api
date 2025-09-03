/*
 file name, file path
 test.txt, 'Hello world'
 */
import 'dart:io';

Future<bool> writeFile(String filePath, String data) async {
  File f = new File(filePath);
  await f.writeAsString(data);
  return true;
}

Future<bool> appendFile(String filePath, String data) async {
  File f = new File(filePath);
  await f.writeAsString(data, mode: FileMode.append);
  return true;
}

Future<bool> readFile(String filePath) async {
  File f = new File(filePath);
  await f.readAsString();
  return true;
}

void main() async {
  // var bol = await appendFile('test.txt', '\n Hello Testing');
  // var bol = await writeFile("test.txt", "Hello world");
  // var result = bol ? "success" : 'fail';
  var result = await readFile('test.txt');
  print(result);
}
