import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/domain/entities/result.dart';
import 'package:modular/domain/error/errors.dart';
import 'package:modular/domain/repo/search_repo.dart';

part 'search_by_text.g.dart';

mixin SearchByText {
  Future<Either<Failure, List<Result>>> call(String textSearch);
}

@Injectable(singleton: false)
class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(String? textSearch) async {
    if (textSearch?.isEmpty ?? true) {
      return Left(InvalidSearchText());
    }
    return repository.getUsers(textSearch!);
  }
}
