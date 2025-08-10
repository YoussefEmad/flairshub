import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import 'token_storage.dart';

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    final uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    return client.post(
      uri,
      headers: {
        'Authorization': 'Bearer ${TokenStorage.accessToken}',
        'Content-Type': 'application/json',
      },
      body: body,
    );
  }
  Future<http.Response> get(String endpoint, Map<String, dynamic> body) {
    final uri = Uri.parse(ApiConstants.baseUrl + endpoint);
    return client.post(
      uri,
      headers: {
        'Authorization': 'Bearer ${TokenStorage.accessToken}',
        'Content-Type': 'application/json',
      },
      body: body,
    );
  }
}
