import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/infra/data_source/search_data_source.dart';
import 'package:modular/infra/models/result_model.dart';

part 'github_search_datasource.g.dart';

@Injectable(singleton: false)
class GithubSearchDatasource implements SearchDatasource {
  final Client client;

  GithubSearchDatasource(this.client);

  @override
  Future<List<ResultModel>?> searchText(String textSearch) async {
    var url = Uri.parse("https://api.github.com/search/users?q=$textSearch");
    var result = await this.client.get(url);
    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      print('execute datasource');
      var jsonList = json['items'] as List;
      var list = jsonList
          .map((item) => ResultModel(
          name: '',
          nickname: item['login'],
          image: item['avatar_url'],
          url: item['url']))
          .toList();
      return list;
    } else {
      throw Exception();
    }
  }
}
