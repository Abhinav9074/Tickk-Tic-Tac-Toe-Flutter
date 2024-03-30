import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiController extends GetxController {
  //Main list controlling logic
  RxList<List<int>> list = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ].obs;

  List<int> human = [];
  List<int> computer = [];
  int randomNumber1 = 0;
  int randomNumber2 = 0;
  var random = Random();

  //For giving and denying screen access
  RxBool coverObjectVisibility = false.obs;

  RxString gameStatus = '-1'.obs;

  //Keeping track of previously selected index
  List<String> selectedNumbers = [];

  //Human turn function
  void checkMark(int x, int y) {
    //If the duplicate click happens
    if (selectedNumbers.contains([x, y].join())) {
      return;
    }

    //For stopping screen access from player
    coverObjectVisibility = true.obs;

    //maeking the checked box in the list
    human.add(list[x][y]);
    list[x][y] = 0;

    if (checkWinStatus(human) == true) {
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
    computerMove();
  }

  //Computer Turn function
  void computerMove() async {
    //Waiting 1 second before playing
    await Future.delayed(const Duration(seconds: 1));

    if(intelligentLogic(computer)==true||intelligentLogic(human)==true||captureCenter()==true){
      return;
    }


    //keeping a set for avoiding infinite looping
    Set<String> checkSet = <String>{};

    //Checking if the indexes is already checked or not
    while (selectedNumbers.contains([randomNumber1, randomNumber2].join())) {
      //generating 2 random indexes
      randomNumber1 = random.nextInt(3);
      randomNumber2 = random.nextInt(3);

      //updating the set for avoiding infinite looping
      checkSet.add([randomNumber1, randomNumber2].join());
      //handeling the set condition
      if (checkSet.length >= 9) {
        //giving the user screen access because the game is over
        coverObjectVisibility = false.obs;

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
    selectedNumbers.add([randomNumber1, randomNumber2].join());

    //Saving the selected indexes for future checking
    computer.add(list[randomNumber1][randomNumber2]);
    list[randomNumber1][randomNumber2] = -1;
    if (checkWinStatus(computer) == true) {
      gameStatus = '1'.obs;
      update();
      Get.snackbar('You Loose', 'Try Again',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    //Giving the player screen access
    coverObjectVisibility = false.obs;

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

    human = [];
    computer = [];
    randomNumber1 = 0;
    randomNumber2 = 0;
    coverObjectVisibility = false.obs;
    gameStatus = '-1'.obs;
    selectedNumbers = [];
    update();
  }

  //logic for checking and making a winning move
  bool winningLogic(){

    if(computer.contains(1)&&computer.contains(2)){

    }
    return false;
  }

//logic of not letting the user to win
  bool intelligentLogic(List<int>checkList) {

    //first row logic horizontal
    if (checkList.contains(1) && checkList.contains(2)&&!selectedNumbers.contains([0,2].join())) {
      // if(selectedNumbers.contains([0,2].join())){
      //   return false;
      // }
      finishComputerMove(0, 2);
      return true;
    }else if(checkList.contains(1) && checkList.contains(3)&&!selectedNumbers.contains([0,1].join())){
      // if(selectedNumbers.contains([0,1].join())){
      //   return false;
      // }
      finishComputerMove(0, 1);
      return true;
    }else if(checkList.contains(2) && checkList.contains(3)&&!selectedNumbers.contains([0,0].join())){
      // if(selectedNumbers.contains([0,0].join())){
      //   return false;
      // }
      finishComputerMove(0, 0);
      return true;

      //second row logic horizontal
    }else if(checkList.contains(4) && checkList.contains(5)&&!selectedNumbers.contains([1,2].join())) {
      // if(selectedNumbers.contains([1,2].join())){
      //   return false;
      // }
      finishComputerMove(1, 2);
      return true;
    }else if(checkList.contains(4) && checkList.contains(6)&&!selectedNumbers.contains([1,1].join())){
      // if(selectedNumbers.contains([1,1].join())){
      //   return false;
      // }
      finishComputerMove(1, 1);
      return true;
    }else if(checkList.contains(5) && checkList.contains(6)&&!selectedNumbers.contains([1,0].join())){
      // if(selectedNumbers.contains([1,0].join())){
      //   return false;
      // }
      finishComputerMove(1, 0);
      return true;

      //thrid row logic horizontal
    }else if(checkList.contains(7) && checkList.contains(8)&&!selectedNumbers.contains([2,2].join())) {
      // if(selectedNumbers.contains([2,2].join())){
      //   return false;
      // }
      finishComputerMove(2, 2);
      return true;
    }else if(checkList.contains(7) && checkList.contains(9)&&!selectedNumbers.contains([2,1].join())){
      // if(selectedNumbers.contains([2,1].join())){
      //   return false;
      // }
      finishComputerMove(2, 1);
      return true;
    }else if(checkList.contains(8) && checkList.contains(9)&&!selectedNumbers.contains([2,0].join())){
      // if(selectedNumbers.contains([2,0].join())){
      //   return false;
      // }
      finishComputerMove(2, 0);
      return true;

      //first column logic vertical
    }else if(checkList.contains(1) && checkList.contains(4)&&!selectedNumbers.contains([2,0].join())) {
      // if(selectedNumbers.contains([2,0].join())){
      //   return false;
      // }
      finishComputerMove(2,0);
      return true;
    }else if(checkList.contains(1) && checkList.contains(7)&&!selectedNumbers.contains([1,0].join())){
      // if(selectedNumbers.contains([1,0].join())){
      //   return false;
      // }
      finishComputerMove(1,0);
      return true;
    }else if(checkList.contains(4) && checkList.contains(7)&&!selectedNumbers.contains([0,0].join())){
      // if(selectedNumbers.contains([0,0].join())){
      //   return false;
      // }
      finishComputerMove(0, 0);
      return true;

      //second column logic vertical
    }else if(checkList.contains(2) && checkList.contains(5)&&!selectedNumbers.contains([2,1].join())) {
      // if(selectedNumbers.contains([2,1].join())){
      //   return false;
      // }
      finishComputerMove(2,1);
      return true;
    }else if(checkList.contains(2) && checkList.contains(8)&&!selectedNumbers.contains([1,1].join())){
      // if(selectedNumbers.contains([1,1].join())){
      //   return false;
      // }
      finishComputerMove(1,1);
      return true;
    }else if(checkList.contains(5) && checkList.contains(8)&&!selectedNumbers.contains([0,1].join())){
      // if(selectedNumbers.contains([0,1].join())){
      //   return false;
      // }
      finishComputerMove(0, 1);
      return true;

      //third column logic vertical
    }else if(checkList.contains(3) && checkList.contains(6)&&!selectedNumbers.contains([2,2].join())) {
      // if(selectedNumbers.contains([2,2].join())){
      //   return false;
      // }
      finishComputerMove(2,2);
      return true;
    }else if(checkList.contains(3) && checkList.contains(9)&&!selectedNumbers.contains([1,2].join())){
      // if(selectedNumbers.contains([1,2].join())){
      //   return false;
      // }
      finishComputerMove(1,2);
      return true;
    }else if(checkList.contains(6) && checkList.contains(9)&&!selectedNumbers.contains([0,2].join())){
      // if(selectedNumbers.contains([0,2].join())){
      //   return false;
      // }
      finishComputerMove(0, 2);
      return true;

      //first diagonal logic , top left to bottom right
    }else if(checkList.contains(1) && checkList.contains(5)&&!selectedNumbers.contains([2,2].join())) {
      // if(selectedNumbers.contains([2,2].join())){
      //   return false;
      // }
      finishComputerMove(2,2);
      return true;
    }else if(checkList.contains(1) && checkList.contains(9)&&!selectedNumbers.contains([1,1].join())){
      // if(selectedNumbers.contains([1,1].join())){
      //   return false;
      // }
      finishComputerMove(1,1);
      return true;
    }else if(checkList.contains(5) && checkList.contains(9)&&!selectedNumbers.contains([0,0].join())){
      // if(selectedNumbers.contains([0,0].join())){
      //   return false;
      // }
      finishComputerMove(0, 0);
      return true;

      //second diagonal logic , top right to bottom left
    }else if(checkList.contains(3) && checkList.contains(5)&&!selectedNumbers.contains([2,0].join())) {
      // if(selectedNumbers.contains([2,0].join())){
      //   return false;
      // }
      finishComputerMove(2,0);
      return true;
    }else if(checkList.contains(3) && checkList.contains(7)&&!selectedNumbers.contains([1,1].join())){
      // if(selectedNumbers.contains([1,1].join())){
      //   return false;
      // }
      finishComputerMove(1,1);
      return true;
    }else if(checkList.contains(5) && checkList.contains(7)&&!selectedNumbers.contains([0,2].join())){
      // if(selectedNumbers.contains([0,2].join())){
      //   return false;
      // }
      finishComputerMove(0, 2);
      return true;
    }

    return false;
  }

  bool captureCenter(){
    if(!selectedNumbers.contains([1,1].join())){
      finishComputerMove(1, 1);
      return true;
    }

    return false;
  }

  void finishComputerMove(int x, int y) {
    //Selecting the computer selected box
    selectedNumbers.add([x, y].join());

    //Saving the selected indexes for future checking
    computer.add(list[x][y]);
    list[x][y] = -1;
    if (checkWinStatus(computer) == true) {
      gameStatus = '1'.obs;
      update();
      Get.snackbar('You Loose', 'Try Again',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    coverObjectVisibility = false.obs;
    update();
  }
}
