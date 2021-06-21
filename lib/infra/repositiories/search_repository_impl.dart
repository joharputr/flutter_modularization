import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/domain/entities/result.dart';
import 'package:modular/domain/error/errors.dart';
import 'package:modular/domain/repo/search_repo.dart';
import 'package:modular/infra/data_source/search_data_source.dart';
part 'search_repository_impl.g.dart';

@Injectable(singleton: false)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Result>>> getUsers(String searchText) async {
    try {
      final list = await datasource.searchText(searchText);
      if (list == null) {
        return Left<Failure, List<Result>>(DatasourceResultNull());
      }
      if (list.isEmpty) {
        return Left(EmptyList());
      }
      return Right<Failure, List<Result>>(list);
    } catch (e) {
      return Left<Failure, List<Result>>(ErrorSearch());
    }
  }
}
