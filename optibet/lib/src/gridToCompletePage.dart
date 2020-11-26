import 'package:flutter/material.dart';
import 'package:optibet/src/config/const.dart';
import 'models/Game.dart';
import 'package:google_fonts/google_fonts.dart';

class GridToCompletePage extends StatefulWidget {

  GridToCompletePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GridToCompletePageState createState() => _GridToCompletePageState();
}


class _GridToCompletePageState extends State<GridToCompletePage> {
  List<Game> grids = [
    new Game('Liverpool', 'Arsenal'),
    new Game('Man. City', 'Leicester'),
    new Game('Liverpool', 'Arsenal'),
    new Game('Man. City', 'Leicester'),
    new Game('Liverpool', 'Arsenal'),
    new Game('Man. City', 'Leicester'),
    new Game('Liverpool', 'Arsenal'),
    new Game('Man. City', 'Leicester'),
    new Game('Liverpool', 'Arsenal'),
    new Game('Man. City', 'Leicester'),
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

  Widget card(Game game, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Center(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // Afficher les cotes
          },
          child: Container(
              width: width * 0.9,
              height: height / 18,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children : [
                    new Container(
                      color : Colors.white60,
                      width: width * 0.30,
                      padding: EdgeInsets.all(5),
                      child: new RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: game.team1,
                            style: GoogleFonts.portLligatSans(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: PRIMARYCOLOR,
                            ),
                          )
                        ),
                      ),
                    _box('1', context),
                    _box('N', context),
                    _box('2', context),
                    new Container(
                      color : Colors.white60,
                      width: width * 0.3,
                      padding: EdgeInsets.all(5),
                      child: new RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: game.team2,
                            style: GoogleFonts.portLligatSans(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: PRIMARYCOLOR,
                            ),
                          )
                      ),
                    ),
                  ]
              )
          ),
        ),
    );
  }

  Widget _box(String name, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Color _currentColor = Colors.white54;
    bool selected = false;
    return InkWell(
      onTap: () {
        setState(){
          if(!selected) {
            _currentColor = Colors.green;
          }
          else {
            _currentColor = Colors.white54;
          }
          selected = !selected;
        }
      },
      child: Container(
        color : selected ? Colors.green : Colors.white54,
        width: width * 0.08,
        padding: EdgeInsets.all(5),
        child: new RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: name,
              style: GoogleFonts.portLligatSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: PRIMARYCOLOR,
              ),
            )
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
