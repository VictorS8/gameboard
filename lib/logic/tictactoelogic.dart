class TicTacToeLogic {
  static final int playerOne = 1;
  static final int playerTwo = 2;

  List<int> list = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  void clearTicTacToe() {
    for (int i = 0; i <= 8; i++) this.list[i] = 0;
  }

  int oneMove(int indexNumber, int whichPlayer) {
    if (this.list[indexNumber] == 0) this.list[indexNumber] = whichPlayer;
    return verifyWin();
  }

  int verifyWin() {
    int winner = 0;

    // Horizontal Counters
    int counterPlayerOneHorizontalOne = 0;
    int counterPlayerOneHorizontalTwo = 0;
    int counterPlayerOneHorizontalThree = 0;
    int counterPlayerTwoHorizontalOne = 0;
    int counterPlayerTwoHorizontalTwo = 0;
    int counterPlayerTwoHorizontalThree = 0;

    // Vertical Counters
    int counterPlayerOneVerticalOne = 0;
    int counterPlayerOneVerticalTwo = 0;
    int counterPlayerOneVerticalThree = 0;
    int counterPlayerTwoVerticalOne = 0;
    int counterPlayerTwoVerticalTwo = 0;
    int counterPlayerTwoVerticalThree = 0;

    // Diagonal LtR Counter
    int counterPlayerOneDiagonalLtr = 0;
    int counterPlayerTwoDiagonalLtr = 0;

    // Diagonal RtL Counter
    int counterPlayerOneDiagonalRtl = 0;
    int counterPlayerTwoDiagonalRtl = 0;

    // Win in Horizontal Way
    for (int i = 0; i <= 8; i++) {
      // Player One Win
      if (this.list[i] == 1 && (i == 0 || i == 1 || i == 2)) {
        counterPlayerOneHorizontalOne += 1;
        if (counterPlayerOneHorizontalOne == 3) winner = playerOne;
      } else if (this.list[i] == 1 && (i == 3 || i == 4 || i == 5)) {
        counterPlayerOneHorizontalTwo += 1;
        if (counterPlayerOneHorizontalTwo == 3) winner = playerOne;
      } else if (this.list[i] == 1 && (i == 6 || i == 7 || i == 8)) {
        counterPlayerOneHorizontalThree += 1;
        if (counterPlayerOneHorizontalThree == 3) winner = playerOne;
      }

      // Player Two Win
      if (this.list[i] == 2 && (i == 0 || i == 1 || i == 2)) {
        counterPlayerTwoHorizontalOne += 1;
        if (counterPlayerTwoHorizontalOne == 3) winner = playerTwo;
      } else if (this.list[i] == 2 && (i == 3 || i == 4 || i == 5)) {
        counterPlayerTwoHorizontalTwo += 1;
        if (counterPlayerTwoHorizontalTwo == 3) winner = playerTwo;
      } else if (this.list[i] == 2 && (i == 6 || i == 7 || i == 8)) {
        counterPlayerTwoHorizontalThree += 1;
        if (counterPlayerTwoHorizontalThree == 3) winner = playerTwo;
      }
    }

    // Win in Vertical Way
    for (int i = 0; i <= 8; i += 3) {
      // Player One Win
      if (this.list[i] == 1 && (i == 0 || i == 3 || i == 6)) {
        counterPlayerOneVerticalOne += 1;
        if (counterPlayerOneVerticalOne == 3) winner = playerOne;
      } else if (this.list[i] == 1 && (i == 1 || i == 4 || i == 7)) {
        counterPlayerOneVerticalTwo += 1;
        if (counterPlayerOneVerticalTwo == 3) winner = playerOne;
      } else if (this.list[i] == 1 && (i == 2 || i == 5 || i == 8)) {
        counterPlayerOneVerticalThree += 1;
        if (counterPlayerOneVerticalThree == 3) winner = playerOne;
      }

      // Player Two Win
      if (this.list[i] == 2 && (i == 0 || i == 3 || i == 6)) {
        counterPlayerTwoVerticalOne += 1;
        if (counterPlayerTwoVerticalOne == 3) winner = playerTwo;
      } else if (this.list[i] == 2 && (i == 1 || i == 4 || i == 7)) {
        counterPlayerTwoVerticalTwo += 1;
        if (counterPlayerTwoVerticalTwo == 3) winner = playerTwo;
      } else if (this.list[i] == 2 && (i == 2 || i == 5 || i == 8)) {
        counterPlayerTwoVerticalThree += 1;
        if (counterPlayerTwoVerticalThree == 3) winner = playerTwo;
      }

      // To make the jump into the vertical lines
      if (i == 6) {
        i = -2;
      } else if (i == 7) {
        i = -1;
      }
    }

    // Win in Diagonal Way (LtR)
    for (int i = 0; i <= 8; i += 4) {
      // Player One Win
      if (this.list[i] == 1) {
        counterPlayerOneDiagonalLtr += 1;
        if (counterPlayerOneDiagonalLtr == 3) winner = playerOne;
      }

      // Player Two Win
      if (this.list[i] == 2) {
        counterPlayerTwoDiagonalLtr += 1;
        if (counterPlayerTwoDiagonalLtr == 3) winner = playerTwo;
      }
    }

    // Win in Diagonal Way (RtL)
    for (int i = 2; i <= 6; i += 2) {
      // Player One Win
      if (this.list[i] == 1) {
        counterPlayerOneDiagonalRtl += 1;
        if (counterPlayerOneDiagonalRtl == 3) winner = playerOne;
      }

      // Player Two Win
      if (this.list[i] == 2) {
        counterPlayerTwoDiagonalRtl += 1;
        if (counterPlayerTwoDiagonalRtl == 3) winner = playerTwo;
      }
    }
    return winner;
  }
}
