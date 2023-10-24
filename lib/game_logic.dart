import 'dart:math';


class Player{
  static const x='x';
  static const o='o';
  static const empty='';
  static List<int> playerx =[];
  static List<int> playero =[];

}
extension ContainsAll on List{
 bool  containsAll(int x,int y, [z]){
   if(z == null) {
     return contains(x)&&contains(y);
   } else
     return contains(x)&& contains(y)&&contains(z);


  }
}


class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'x') {
      Player.playerx.add(index);
    } else {
      Player.playero.add(index);
    }
  }

  String checkWinner() {
    String winner = '';
    bool gameOver = false;

    if (Player.playerx.containsAll(0, 1, 2) ||
        Player.playerx.containsAll(3, 4, 5) ||
        Player.playerx.containsAll(6, 7, 8) ||
        Player.playerx.containsAll(0, 3, 6) ||
        Player.playerx.containsAll(1, 4, 7) ||
        Player.playerx.containsAll(2, 5, 8) ||
        Player.playerx.containsAll(0, 4, 8) ||
        Player.playerx.containsAll(2, 4, 6)) {
      winner = 'x';
    } else if (Player.playero.containsAll(0, 1, 2) ||
        Player.playero.containsAll(3, 4, 5) ||
        Player.playero.containsAll(6, 7, 8) ||
        Player.playero.containsAll(0, 3, 6) ||
        Player.playero.containsAll(1, 4, 7) ||
        Player.playero.containsAll(2, 5, 8) ||
        Player.playero.containsAll(0, 4, 8) ||
        Player.playero.containsAll(2, 4, 6))
      winner = 'o';
    else
      winner = '';

    return winner;
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];
    for (var i = 0; i < 8; i++) {
      if (!(Player.playerx.contains(i) || Player.playero.contains(i)))
        emptyCells.add(i);

    }//start - center
      if (Player.playero.containsAll(0, 1) && emptyCells.contains(2)) {
        index = 2;
      } else if (Player.playero.containsAll(3, 4) && emptyCells.contains(5)) {
        index = 5;
      } else if (Player.playero.containsAll(6, 7) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playero.containsAll(0, 3) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playero.containsAll(1, 4) && emptyCells.contains(7)) {
        index = 7;
      } else if (Player.playero.containsAll(2, 5) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playero.containsAll(0, 4) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playero.containsAll(2, 4) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playero.containsAll(0, 2) && emptyCells.contains(1)) {
        index = 1;
      } else if (Player.playero.containsAll(3, 5) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playero.containsAll(6, 8) && emptyCells.contains(7)) {
        index = 7;
      } else if (Player.playero.containsAll(0, 6) && emptyCells.contains(3)) {
        index = 3;
      } else if (Player.playero.containsAll(1, 7) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playero.containsAll(2, 8) && emptyCells.contains(5)) {
        index = 5;
      } else if (Player.playero.containsAll(0, 8) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playero.containsAll(2, 6) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playero.containsAll(1, 2) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playero.containsAll(4, 5) && emptyCells.contains(3)) {
        index = 3;
      } else if (Player.playero.containsAll(7, 8) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playero.containsAll(3, 6) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playero.containsAll(4, 7) && emptyCells.contains(1)) {
        index = 1;
      } else if (Player.playero.containsAll(5, 8) && emptyCells.contains(2)) {
        index = 2;
      } else if (Player.playero.containsAll(4, 8) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playero.containsAll(4, 6) && emptyCells.contains(2)) {
        index = 2;
      } else if (Player.playerx.containsAll(0, 1) && emptyCells.contains(2)) {
        index = 2;
      } else if (Player.playerx.containsAll(3, 4) && emptyCells.contains(5)) {
        index = 5;
      } else if (Player.playerx.containsAll(6, 7) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playerx.containsAll(0, 3) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playerx.containsAll(1, 4) && emptyCells.contains(7)) {
        index = 7;
      } else if (Player.playerx.containsAll(2, 5) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playerx.containsAll(0, 4) && emptyCells.contains(8)) {
        index = 8;
      } else if (Player.playerx.containsAll(2, 4) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playerx.containsAll(0, 2) && emptyCells.contains(1)) {
        index = 1;
      } else if (Player.playerx.containsAll(3, 5) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playerx.containsAll(6, 8) && emptyCells.contains(7)) {
        index = 7;
      } else if (Player.playerx.containsAll(0, 6) && emptyCells.contains(3)) {
        index = 3;
      } else if (Player.playerx.containsAll(1, 7) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playerx.containsAll(2, 8) && emptyCells.contains(5)) {
        index = 5;
      } else if (Player.playerx.containsAll(0, 8) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playerx.containsAll(2, 6) && emptyCells.contains(4)) {
        index = 4;
      } else if (Player.playerx.containsAll(1, 2) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playerx.containsAll(4, 5) && emptyCells.contains(3)) {
        index = 3;
      } else if (Player.playerx.containsAll(7, 8) && emptyCells.contains(6)) {
        index = 6;
      } else if (Player.playerx.containsAll(3, 6) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playerx.containsAll(4, 7) && emptyCells.contains(1)) {
        index = 1;
      } else if (Player.playerx.containsAll(5, 8) && emptyCells.contains(2)) {
        index = 2;
      } else if (Player.playerx.containsAll(4, 8) && emptyCells.contains(0)) {
        index = 0;
      } else if (Player.playerx.containsAll(4, 6) && emptyCells.contains(2)) {
        index = 2;
      } else {
          Random random = Random();
        int randomIndex = random.nextInt(emptyCells.length);

        index = emptyCells[randomIndex];
      }
      playGame(index, activePlayer);
    }
  }

