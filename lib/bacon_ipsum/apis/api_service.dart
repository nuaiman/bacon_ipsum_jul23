import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<String>> fetchBaconIpsum() async {
    final response = await http
        .get(Uri.parse('https://baconipsum.com/api/?type=meat-and-filler'));
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load bacon ipsum');
    }
  }

  String generateRandomImage() {
    final random = Random();
    return 'https://picsum.photos/200/300/?random=${random.nextInt(100)}';
  }
}
