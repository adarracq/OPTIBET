import 'package:flutter/material.dart';
import 'package:optibet/src/homePage.dart';
import 'package:optibet/src/myGamesPage.dart';
import 'Widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/const.dart';




class ProfilePage extends StatefulWidget {

  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

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

  Widget _entryField(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: TextEditingController(text: value),
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
        ],
      ),
    );
  }
  Widget _credit(bool real) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            real? 'Crédits (réels)   ' : 'Crédits (virtuels)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            real? '5,50 €' : '180 OC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Icon(Icons.add)
        ],
      ),
    );
  }


  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Profil',
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
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(height: 20),
                        _formWidget(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text('Modifier mot de passe',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: 40),
                        _credit(true),
                        SizedBox(height: 20),
                        _credit(false),
                        SizedBox(height: 40),
                        _submitButton()
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

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomePage(),
            transitionDuration: Duration(seconds: 0)
        )
    );
  }

  Widget _formWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email", "antoine.cheval.darracq@gmail.com"),
        _entryField("Pseudo", "CoucouCestMoi"),
      ],
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [SECONDCOLOR, PRIMARYCOLOR])),
      child: Text(
        'Valider',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }


  Widget bottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: 2,
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
        case 1:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => MyGamesPage(),
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

