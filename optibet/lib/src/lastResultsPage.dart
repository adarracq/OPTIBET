import 'package:flutter/material.dart';
import 'package:optibet/src/config/const.dart';
import 'models/Grid.dart';
import 'package:google_fonts/google_fonts.dart';

class LastResultsPage extends StatefulWidget {

  LastResultsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LastResultsPageState createState() => _LastResultsPageState();
}


class _LastResultsPageState extends State<LastResultsPage> {
  List<Grid> grids = [
    new Grid('Grille du 23/11', 'Il y a 3 jours', '15 matchs, (PL/Serie A)', Colors.white30),
    new Grid('Grille du 24/11', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 26/11', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 28/11', 'Il y a 3 jours', 'PL/Serie A',Colors.lightGreen),
    new Grid('Grille du 01/12', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 05/12', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 28/11', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 01/12', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen),
    new Grid('Grille du 05/12', 'Il y a 3 jours', 'PL/Serie A', Colors.lightGreen)
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child :Container(
            height:height,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2)
            ],
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [SECONDCOLOR, PRIMARYCOLOR])),
            child: Stack(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 80),
                  child: new ListView.builder(
                    itemCount: grids.length,
                    itemBuilder: (context, i) {
                      return card(grids[i], context);
                    },
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          )
        )
    );
  }

  Widget card(Grid grid, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Center(
      child: Card(
        elevation: 5,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {

            },
          child: Container(
            width: width * 0.9,
            height: height / 7,
              color: grid.color,
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children : [
                    new RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: grid.date,
                      style: GoogleFonts.portLligatSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        ),
                      )
                    ),
                        new RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: grid.title,
                              style: GoogleFonts.portLligatSans(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: PRIMARYCOLOR,
                              ),
                            )
                        ),
                    new RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          text: grid.detail,
                          style: GoogleFonts.portLligatSans(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          ),
                        )
                    ),
                  ]
                )
            ),
          ),
        ),
      );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Retour',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
