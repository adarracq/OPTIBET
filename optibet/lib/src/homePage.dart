import 'package:flutter/material.dart';
import 'package:optibet/src/myGamesPage.dart';
import 'package:optibet/src/profilePage.dart';
import 'Widget/customAlertDialog.dart';
import 'config/const.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build (BuildContext context) {
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child : Scaffold(
        body:SingleChildScrollView(
          child:Container(
          height: MediaQuery.of(context).size.height,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                card('Derniers résultats', 0, context, Icons.access_alarm_outlined),
                card('Prochaines grilles', 1, context, Icons.arrow_forward_ios),
                card('Prochaines compétitions', 2, context, Icons.arrow_forward_ios),
                card('Création grille', 3, context, Icons.create),
                card('Création compétition', 4, context, Icons.create)
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      )
    );
  }

  Widget card(String title, int which, BuildContext context, IconData icon) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     return new Center(
      child: Card(
        elevation: 20,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            switch(which){
              case 0:
                Navigator.pushNamed(context, '/lastresults');
                break;
              case 1:
                Navigator.pushNamed(context, '/nextgrids');
                break;
              case 2:
                Navigator.pushNamed(context, '/nextcompetitons');
                break;
              case 3:
                break;
              case 4:
                break;
            }
          },
          child: Container(
            width: width * 0.9,
            height: height / 7,
            child: Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  new Icon(
                    icon,
                    color: SECONDCOLOR,
                    size: 48.0,
                  ),
                  SizedBox(width: 20),
                  new RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                      text: title,
                      style: GoogleFonts.portLligatSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: PRIMARYCOLOR,
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: 'Êtes-vous sur?',
            descriptions: 'Vous allez être déconnecté',
            yes: 'Oui',
            no: 'Non'
          );
        });
  }

  Widget bottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: switchBottomNavigation,
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
    return Navigator.pushNamed(context, route);
  }

  void switchBottomNavigation(int index) {
    setState(() {
      switch(index) {
        case 1:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => MyGamesPage(),
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

