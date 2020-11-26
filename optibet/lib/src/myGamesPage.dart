import 'package:flutter/material.dart';
import 'package:optibet/src/homePage.dart';
import 'package:optibet/src/profilePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/const.dart';
import 'models/Grid.dart';



class MyGamesPage extends StatefulWidget {

  MyGamesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MygamesPageState createState() => _MygamesPageState();

}

class _MygamesPageState extends State<MyGamesPage> {

  List<Grid> grids = [
    new Grid('Grille du 23/11', 'Dans 3 jours', '15 matchs, PL/Serie A', Colors.white30),
    new Grid('Grille du 24/11', 'Dans 5 jours', 'PL/Serie A', Colors.white30),
    new Grid('Grille du 26/11', 'Dans 7 jours', 'PL/Serie A', Colors.white30),
    new Grid('Grille du 28/11', 'Dans 9 jours', 'PL/Serie A',Colors.white30)
  ];


  Widget _backButton() {
    return InkWell(
      onTap: () {
        _onBackPressed();
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

  Widget _title(String title) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: PRIMARYCOLOR,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child :Scaffold(
          body: Container(
            height: height,
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
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50),
                        _title('En cours'),
                        SizedBox(height: 20),
                        new Container(
                          height: height/3,
                          child: new ListView.builder(
                            itemCount: grids.length,
                            itemBuilder: (context, i) {
                              return card(grids[i], context);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        _title('Terminés'),
                        new Container(
                          height: height/3,
                          child: new ListView.builder(
                            itemCount: grids.length,
                            itemBuilder: (context, i) {
                              return card(grids[i], context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          ),
          bottomNavigationBar : bottomNavigationBar(),
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

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionDuration: Duration(seconds: 0)
        )
    );
  }


  Widget bottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: 1,
      onTap: _switchBottomNavigation,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Accueil'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.accessibility_new),
          title: new Text('Mes parties'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil')
        )
      ],
    );
  }

  navigate(BuildContext context, String route) {
    return  Navigator.pushNamed(context, route);
  }

  void _switchBottomNavigation(int index) {
    setState(() {
      switch(index) {
        case 0:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HomePage(),
                  transitionDuration: Duration(seconds: 0)
              )
          );
          break;
        case 2:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ProfilePage(),
                  transitionDuration: Duration(seconds: 0)
              )
          );
          break;
        default :
          break;
      }
    });
  }

}

