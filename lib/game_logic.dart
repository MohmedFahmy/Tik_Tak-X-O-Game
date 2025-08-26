import 'dart:math';

class Player {
  static String x = 'X';
  static String o = 'O';
  static String empty = '';

  static List<int> playerX = [];
  static List<int> playerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String chrckWinner() {
    String winner = '';
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
    return winner;
  }

  Future autoPlay(String activePlayer) async {
    int index = 0;
    List<int> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!Player.playerX.contains(i) && !Player.playerO.contains(i)) {
        emptyCells.add(i);
      }
    }

    // كل التركيبات اللي ممكن تكسب
    List<List<int>> winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    // 1- لو الكمبيوتر (O) يقدر يكسب → العب الحركة دي
    for (var pattern in winningPatterns) {
      var count = 0;
      var emptySpot;
      for (var cell in pattern) {
        if (Player.playerO.contains(cell)) {
          count++;
        } else if (emptyCells.contains(cell)) {
          emptySpot = cell;
        }
      }
      if (count == 2 && emptySpot != null) {
        index = emptySpot;
        playGame(index, activePlayer);
        return;
      }
    }

    // 2- لو اللاعب (X) ممكن يكسب → امنعه
    for (var pattern in winningPatterns) {
      var count = 0;
      var emptySpot;
      for (var cell in pattern) {
        if (Player.playerX.contains(cell)) {
          count++;
        } else if (emptyCells.contains(cell)) {
          emptySpot = cell;
        }
      }
      if (count == 2 && emptySpot != null) {
        index = emptySpot;
        playGame(index, activePlayer);
        return;
      }
    }

    // 3- لو الخانة الوسط فاضية → خذها (أفضلية)
    if (emptyCells.contains(4)) {
      index = 4;
    }
    // 4- لو أحد الأركان (corners) فاضي → خذ واحد
    else if (emptyCells.any((e) => [0, 2, 6, 8].contains(e))) {
      var corners = emptyCells.where((e) => [0, 2, 6, 8].contains(e)).toList();
      index = corners[Random().nextInt(corners.length)];
    }
    // 5- لو مفيش → حركة عشوائية
    else {
      index = emptyCells[Random().nextInt(emptyCells.length)];
    }

    playGame(index, activePlayer);
  }
}
