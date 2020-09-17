class Covid {
  int updated;
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int tests;
  String continent;
  String flag;

//covid constactor
  Covid(
      {this.updated,
      this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.tests,
      this.continent,
      this.flag});

//from json map convert covid object

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
         updated : json['updated'] as int,
         country: json['country'] as String,
         cases: json['cases'] as int,
         todayCases: json['todayCases'] as int,
         deaths: json['deaths'] as int,
         todayDeaths: json['todayDeaths'] as int,
         recovered: json['recovered'] as int,
         active: json['active'] as int,
         critical: json['critical'] as int,
         tests: json['tests'] as int,
         continent: json['continent'] as String,
         flag: json['countryInfo']['flag'] as String
    );
  }


}
