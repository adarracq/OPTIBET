import 'dart:ui';
import 'Grid.dart';

class Competition{
  String title;
  String date;
  String detail;
  Color color;
  List<Grid> grids;

  Competition(this.title, this.date, this.detail, this.color, this.grids);
}