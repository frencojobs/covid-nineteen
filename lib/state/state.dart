import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:covid19/model/model.dart';
import 'package:covid19/api/api.dart';

part 'state.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  RestClient _client;

  _MainStore() {
    final dio = Dio();
    _client = RestClient(dio);
  }

  @observable
  Total total;

  @observable
  List<Country> countries;

  @action
  Future getTotal() async {
    this.total = await _client.getAll();
  }

  @action
  Future getCountries() async {
    this.countries = await _client.getCountries();
  }
}
