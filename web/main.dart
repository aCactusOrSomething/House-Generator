import 'dart:html';
import 'HouseLogo.dart';
import 'dart:math' as Math;

void main() {
  int num = 12;
  String color = "FF0000";
  if(Uri.base.queryParameters['num'] != null)
    num = int.parse(Uri.base.queryParameters['num']);
  if(Uri.base.queryParameters['color'] != null)
    color = Uri.base.queryParameters['color'];

  HouseLogo house = new HouseLogo(num, "#$color", new Math.Random());
  querySelector('#output').appendHtml(house.display());
  querySelector('#output').append(house.getDrawnHouse());
}
