// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    iso2: json['iso2'] as String,
    iso3: json['iso3'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    country: json['country'] as String,
    countryInfo: json['countryInfo'] == null
        ? null
        : CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
    cases: json['cases'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    active: json['active'] as int,
    critical: json['critical'] as int,
    casesPerOneMillion: (json['casesPerOneMillion'] as num)?.toDouble(),
    deathsPerOneMillion: (json['deathsPerOneMillion'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country': instance.country,
      'countryInfo': instance.countryInfo,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
    };

Total _$TotalFromJson(Map<String, dynamic> json) {
  return Total(
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recovered: json['recovered'] as int,
    updated: json['updated'] as int,
  );
}

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'updated': instance.updated,
    };
