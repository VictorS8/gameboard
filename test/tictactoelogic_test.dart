import 'package:gameboard/logic/tictactoelogic.dart';

void main() {
  TicTacToeLogic tttlogic = TicTacToeLogic();
  tttlogic.oneMove(1, 1);
  tttlogic.oneMove(4, 1);
  tttlogic.oneMove(7, 1);
  print(tttlogic.verifyWin());
  tttlogic.clearTicTacToe();
  print(tttlogic.verifyWin());
}
