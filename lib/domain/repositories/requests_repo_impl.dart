import '../../data/repositories/requests_repo.dart';
import '../../data/datasources/requests_remote_ds.dart';

class RequestsRepositoryImpl implements RequestsRepository {
  final RequestsRemoteDataSource remoteDataSource;

  RequestsRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> submitRequest(Map<String, dynamic> request) {
    return remoteDataSource.submitRequest(request);
  }
}
