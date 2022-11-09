// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* В library мы написали свою библиотеку, функция в которой возвращает массив с
реверсивными числами. В контракте Demo мы эту функцию применили */

library ArrayExtension {
  function reverse(uint[] storage _myArr) internal view returns(uint[] memory) {
    uint[] memory newArr = new uint[](_myArr.length);
    uint j;

    for(uint i = _myArr.length; i > 0; i--) {
      newArr[j] = _myArr[i - 1];
      j++;
    }
    return newArr;
  }
}

contract Demo {
  using ArrayExtension for uint[];
  uint[] public arr = [1, 2, 3];

  function doReverse() public view returns(uint[] memory) {
    return arr.reverse();
  }
}