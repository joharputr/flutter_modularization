
import 'package:dartz/dartz.dart';
import 'package:modular/domain/entities/result.dart';
import 'package:modular/domain/error/errors.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Result>>> getUsers(String searchText);
}