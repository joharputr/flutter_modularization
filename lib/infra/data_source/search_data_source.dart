
import 'package:modular/infra/models/result_model.dart';

abstract class SearchDatasource {
  Future<List<ResultModel>?> searchText(String textSearch);
}
