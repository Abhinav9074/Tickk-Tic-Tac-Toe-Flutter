import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  //Main list controlling logic
  RxList<List<int>> list = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ].obs;

  List<int> player1 = [];
  List<int> player2 = [];
   RxBool player1Turn = true.obs;

  RxString gameStatus = '-1'.obs;

  //Keeping track of previously selected index
  List<String> selectedNumbers = [];

  //Human turn function
  void player1Move(int x, int y) {
    //If the duplicate click happens
    if (selectedNumbers.contains([x, y].join())) {
      return;
    }

    //maeking the checked box in the list
    player1.add(list[x][y]);
    list[x][y] = 0;

    if (checkWinStatus(player1) == true) {
      gameStatus = '0'.obs;
      update();
      Get.snackbar('You Win', 'Congratulations',
          backgroundColor: Colors.green, colorText: Colors.white);
      return;
    }

    //storing the checked indexes for checking
    selectedNumbers.add([x, y].join());

    //for rebuilding the UI -Getx
    update();

    //Giving computer the chance to play
  }

  //Computer Turn function
  void player2Move(int x, int y) async {
    //Waiting 1 second before playing
    await Future.delayed(const Duration(seconds: 1));

    //keeping a set for avoiding infinite looping
    Set<String> checkSet = <String>{};

    //Checking if the indexes is already checked or not
  while (selectedNumbers.contains([x, y].join())) {

      //updating the set for avoiding infinite looping
      checkSet.add([x, y].join());
      //handeling the set condition
      if (checkSet.length >= 9) {

        gameStatus = '2'.obs;

        //Ui rebuilding Getx
        update();

        //Displaying a snack bar
        Get.snackbar('Draw', 'No More Moves',
            backgroundColor: Colors.blue, colorText: Colors.white);

        //Exiting from the function
        return;
      }
    }

    //Selecting the computer selected box
    selectedNumbers.add([x, y].join());

    //Saving the selected indexes for future checking
    player2.add(list[x][y]);
    list[x][y] = -1;
    if (checkWinStatus(player2) == true) {
      gameStatus = '1'.obs;
      update();
      Get.snackbar('You Loose', 'Try Again',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    //UI updation Getx
    update();
  }

  bool checkWinStatus(List<int> lst) {
    if (lst.contains(1) && lst.contains(2) && lst.contains(3) ||
        lst.contains(4) && lst.contains(5) && lst.contains(6) ||
        lst.contains(7) && lst.contains(8) && lst.contains(9) ||
        lst.contains(1) && lst.contains(4) && lst.contains(7) ||
        lst.contains(2) && lst.contains(5) && lst.contains(8) ||
        lst.contains(3) && lst.contains(6) && lst.contains(9) ||
        lst.contains(1) && lst.contains(5) && lst.contains(9) ||
        lst.contains(3) && lst.contains(5) && lst.contains(7)) {
      return true;
    }

    return false;
  }

  void resetAll() {
    list = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ].obs;

    player1 = [];
    player2 = [];
    gameStatus = '-1'.obs;
    selectedNumbers = [];
    update();
  }
}
