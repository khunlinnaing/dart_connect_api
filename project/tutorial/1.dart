import 'package:http/http.dart' as http;

final API_URL = Uri.parse('http://localhost:8000/api/');

void main() async {
  var response = await http.get(API_URL);
  print(response.body);
}
