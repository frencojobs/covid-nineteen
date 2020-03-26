import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class CountryInfo {
  final String iso2;
  final String iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo({
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return _$CountryInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CountryInfoToJson(this);
  }
}

@JsonSerializable()
class Country {
  final String country;
  final CountryInfo countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final double casesPerOneMillion;
  final double deathsPerOneMillion;

  Country({
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
  });

  static const fromJson = _$CountryFromJson;

  Map<String, dynamic> toJson() {
    return _$CountryToJson(this);
  }
}

@JsonSerializable()
class Total {
  final int cases;
  final int deaths;
  final int recovered;
  final int updated;

  Total({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
  });

  static const fromJson = _$TotalFromJson;

  Map<String, dynamic> toJson() {
    return _$TotalToJson(this);
  }
}
