import '../../data/repositories/requests_repo.dart';

class SubmitRequestUseCase {
  final RequestsRepository repository;

  SubmitRequestUseCase(this.repository);

  Future<void> call(Map<String, dynamic> requestData) {
    return repository.submitRequest(requestData);
  }
}
