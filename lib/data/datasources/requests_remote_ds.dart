
import 'package:flairshub/core/network/api_endpoint.dart';

import '../../core/network/api_client.dart';

class RequestsRemoteDataSource {
  final ApiClient client;

  RequestsRemoteDataSource(this.client);
  //
  Future<void> submitRequest(Map<String, dynamic> data) async {
    await client.post(ApiEndpoint.submitRequest, data);
  }
  Future<void> getRequestsList(Map<String, dynamic> data) async {
    await client.get('requests', data);
  }
}
