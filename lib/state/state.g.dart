// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$totalAtom = Atom(name: '_MainStore.total');

  @override
  Total get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(Total value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$countriesAtom = Atom(name: '_MainStore.countries');

  @override
  List<Country> get countries {
    _$countriesAtom.context.enforceReadPolicy(_$countriesAtom);
    _$countriesAtom.reportObserved();
    return super.countries;
  }

  @override
  set countries(List<Country> value) {
    _$countriesAtom.context.conditionallyRunInAction(() {
      super.countries = value;
      _$countriesAtom.reportChanged();
    }, _$countriesAtom, name: '${_$countriesAtom.name}_set');
  }

  final _$getTotalAsyncAction = AsyncAction('getTotal');

  @override
  Future<dynamic> getTotal() {
    return _$getTotalAsyncAction.run(() => super.getTotal());
  }

  final _$getCountriesAsyncAction = AsyncAction('getCountries');

  @override
  Future<dynamic> getCountries() {
    return _$getCountriesAsyncAction.run(() => super.getCountries());
  }

  @override
  String toString() {
    final string =
        'total: ${total.toString()},countries: ${countries.toString()}';
    return '{$string}';
  }
}
