import 'dart:js' as JS;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:covid19/model/model.dart';
import 'package:covid19/state/state.dart';

void main() {
  runApp(Main());
}

final NumberFormat nf = NumberFormat('#,###', 'en_US');

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "COVID19 Statistics",
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: Colors.black,
        splashFactory: InkRipple.splashFactory,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "COVID19 Statistics",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  JS.context.callMethod('open', ['https://github.com/frencojobs/covid19-stats']);
                },
                elevation: 0.0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text(
                  "View Source",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainStore _store;

  @override
  void initState() {
    super.initState();
    _store = MainStore();

    _store.getTotal();
    _store.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: NavigationToolbar.kMiddleSpacing),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: NavigationToolbar.kMiddleSpacing),
            Observer(
              builder: (_) {
                if (_store.total == null) {
                  return CircularProgressIndicator();
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: NavigationToolbar.kMiddleSpacing),
                  child: Flex(
                    direction: MediaQuery.of(context).size.width > 600 ? Axis.horizontal : Axis.vertical,
                    children: <Widget>[
                      NumberCard(
                        imageUrl: 'assets/confirmed_cases.png',
                        number: _store.total.cases,
                        description: 'Confirmed Cases',
                        color: Colors.black,
                      ),
                      NumberCard(
                        imageUrl: 'assets/recovered_cases.png',
                        number: _store.total.recovered,
                        description: 'Total Recovered',
                        color: Colors.green[500],
                      ),
                      NumberCard(
                        imageUrl: 'assets/deceased_cases.png',
                        number: _store.total.deaths,
                        description: 'Total Deceased',
                        color: Colors.red[500],
                      ),
                      NumberCard(
                        imageUrl: 'assets/serious_cases.png',
                        description: 'Critical Cases',
                        color: Colors.orange[500],
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(NavigationToolbar.kMiddleSpacing),
              child: DottedLine(
                dashColor: Colors.grey[300],
                lineThickness: 3,
              ),
            ),
            Observer(
              builder: (_) {
                if (_store.countries == null) {
                  return CircularProgressIndicator();
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: NavigationToolbar.kMiddleSpacing),
                  child: TableComponent(_store.countries),
                );
              },
            ),
            SizedBox(height: NavigationToolbar.kMiddleSpacing),
          ],
        ),
      ),
    );
  }
}

class TableComponent extends StatelessWidget {
  final List<Country> _countries;
  const TableComponent(this._countries, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
          width: 3,
        ),
      ),
      child: DataTable(
        columns: [
          DataColumn(label: Text("")),
          DataColumn(
            label: Text(
              "Region",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          DataColumn(
            label: TableHead("Confirmed", bg: Colors.blue[300]),
          ),
          DataColumn(
            label: TableHead("Recovered", bg: Colors.green[300]),
          ),
          DataColumn(
            label: TableHead("Deceased", bg: Colors.red[300]),
          ),
          DataColumn(
            label: TableHead("Critical", bg: Colors.orange[300]),
          ),
        ],
        rows: _countries.map(
          (c) {
            return DataRow(
              cells: [
                DataCell(
                  Image.network(
                    c.countryInfo.flag,
                    fit: BoxFit.cover,
                    width: kToolbarHeight / 1.5,
                  ),
                ),
                DataCell(
                  Text(
                    c.country,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '${c.cases}',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '${c.recovered}',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '${c.deaths}',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '${c.critical}',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

class TableHead extends StatelessWidget {
  final Color bg;
  final String _label;
  final Color textColor;

  TableHead(
    this._label, {
    Key key,
    @required this.bg,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: this.bg,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(left: 20),
          child: Text(
            _label,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.normal,
                  color: this.textColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  final String imageUrl;
  final int number;
  final String description;
  final Color color;

  const NumberCard({
    this.imageUrl,
    this.number,
    this.description,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: ClipPathShape(),
        child: Card(
          color: Colors.grey[300],
          elevation: 0.0,
          child: InkWell(
            onTap: () {},
            splashColor: this.color.withAlpha(100),
            child: Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    this.imageUrl,
                    height: 70,
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${this.number != null ? nf.format(this.number) : '-'}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: this.color,
                            ),
                      ),
                      Text(this.description, style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClipPathShape extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, (size.height / 2) - radius);
    path.arcToPoint(Offset(radius, (size.height / 2) + radius), clockwise: true, radius: Radius.circular(radius));
    path.arcToPoint(Offset(0.0, (size.height / 2) + radius), clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, (size.height / 2) + radius);
    path.arcToPoint(Offset(size.width - radius, (size.height / 2) - radius), clockwise: true, radius: Radius.circular(radius));
    path.arcToPoint(Offset(size.width, (size.height / 2) - radius), clockwise: true, radius: Radius.circular(radius));

    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
