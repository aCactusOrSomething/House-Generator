import 'dart:html';
import 'HouseLogo.dart';
import 'dart:math' as Math;

void main() {
  HouseLogo house = new HouseLogo(47, "FF0000", new Math.Random());
  querySelector('#output').appendHtml(house.display());
}
