import "dart:math" as Math;


class HouseLogo {
  //List<List<List<bool>>> housePanels;
  int dimensions;
  int _SIDES = 4;
  List myHouse;
  String color;

  HouseLogo(num players, String color, Math.Random rand) {
    _SIDES = 4;
    this.color  = color;
    dimensions = (players / _SIDES).ceil();
    int spotsTaken = 0;
    print("building house with " + players.toString() + "players.");
    if (players % _SIDES > 0) {
      dimensions++;
    }

    List<List<List<bool>>> myHouse = [];
    for (int i = 0; i < _SIDES; i++) {
      myHouse.add([]);
      for (int j = 0; j < dimensions; j++) {
        myHouse[i].add([]);
        for (int k = 0; k < dimensions; k++) {
          myHouse[i][j].add(false);
        }

      }
    }


    for(int i = 0; i < dimensions; i=i) {
      int x = 0;
      int y = 0;
      bool occupied = false;
      bool direction = rand.nextBool();
      while (!occupied) {
        print("starting a partial loop. (x, y) are " + x.toString() + ", " + y.toString());
        if (myHouse[0][x][y] == true) {
          print("i think that " + myHouse[0][x][y].toString() + "is true.");
          if (direction) {
            x++;
          } else {
            y++;
          }
        } else {
          print("i think that " + myHouse[0][x][y].toString() + "is false.");
          if (rand.nextBool() == true && !(x == 0 && y == 0)) {
            print("i want to move...");
            if (!direction) {
              y--;
              direction = true;
              print("in the X axis.");
            } else {
              direction = false;
              x--;
              print("in the Y axis.");
            }
          } else {
            occupied = true;
            print("should exit now...");
          }
        }
        print("completed a partial loop. (x, y) are " + x.toString() + ", " + y.toString());
      }
      for (int j = 0; j < _SIDES; j++) {
        int playersLeft = players - spotsTaken;
        if (playersLeft <= 0) {
          break;
        } else {
          print(myHouse.toString());
          myHouse[j][x][y] = true;
          spotsTaken++;
          print("adding a player. this is player number " + spotsTaken.toString() + " out of" + players.toString() + ", and there are " + playersLeft.toString() + " left." );
          print(myHouse.toString());
        }
      }
      print("completed a loop.");
      i++;
      /*   for (int j = 0; j < _SIDES; j++){
            int playersLeft = players -((i * _SIDES) + j);
            if(playersLeft <= 0) {
               break;
            } else {
               myHouse[j][x][y] = true;
            }
         }
         i++;
      }*/
    }
    this.myHouse = myHouse;
  }

  List getHouse(){
    return myHouse;
  }

  String display() {
    int relSize = myHouse[0][0].length;
    String ret = "";
    for (int i = 0; i < relSize; i++) {
      for (int j = 0; j < relSize; j++) {
        bool middle = myHouse[1][relSize - (i + 1)][relSize - (j + 1)];

        if (middle == true) {
          ret = ret + "[]";
        }else {
          ret = ret + "--";
        }
      }
      for (int j = 0; j < relSize; j++) {
        bool middle = myHouse[0][relSize - (i + 1)][j];
        if (middle == true) {
          ret = ret + "[]";
        }else {
          ret = ret + "--";
        }
      }
      ret = ret + "<br>";
    }
    for (int i = 0; i < relSize; i++) {
      for (int j = 0; j < relSize; j++) {
        bool middle = myHouse[2][i][relSize - (j + 1)];
        if (middle == true) {
          ret = ret + "[]";
        }else {
          ret = ret + "--";
        }
      }
      for (int j = 0; j < relSize; j++) {
        bool middle = myHouse[3][i][j];
        if (middle == true) {
          ret = ret + "[]";
        }else {
          ret = ret + "--";
        }
      }
      ret = ret + "<br>";
    }
    return ret;
  }
}