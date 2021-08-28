import 'dart:convert';
import 'package:http/http.dart' as http;

class Utils {
  final String baseUrl = 'natronz.com';
  login(String email, String password) async {
    var url = Uri.https(baseUrl,
        '/login_api.php', {"q": "dart"});
    final response = await http.post(url, body: {
      "username": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 401) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else if (response.statusCode == 500) {
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
    else{
      final String responseString = response.body;
      return jsonDecode(responseString);
    }
  }
}
