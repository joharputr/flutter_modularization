import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/domain/usecase/search_by_text.dart';
import 'package:modular/external/github_search_datasource.dart';
import 'package:modular/infra/repositiories/search_repository_impl.dart';
import 'package:modular/searchpage.dart';
import 'package:modular/stores/search_stores.dart';

import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $SearchByTextImpl,
    $SearchRepositoryImpl,
    $GithubSearchDatasource,
    Bind.instance<http.Client>(http.Client()),
    $SearchStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, __) => SearchPage()),
  ];
}
