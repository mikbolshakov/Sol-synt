// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* В данном случае мы не можем скопировать код контракта Demo, но нам нужны его
функции. С помощью написанных ниже функций мы считваем значения, меняем значения и 
переводим деньги - все это делаем в контракте Demo через наш контракт */

contract Facilitator {
  bytes public returnedData;
  string public returnedName;

  function callGetName(address _demo) external {
    (bool success, bytes memory data) = _demo.call(
      abi.encodeWithSignature(
        "getName()" // просто возвращает значение
      )
    );
    require(success, "failed");

    returnedData = data;                           // колл возвращает только байтовый массив
    returnedName = string(abi.encodePacked(data)); // конвертируем байтовый массив в строку
  }
    
  function callSetData(address _demo, string calldata _newName, uint _newAge) external {
    (bool success,) = _demo.call(
      abi.encodeWithSignature(
        "setData(string,uint256)", // меняет значения
        _newName,
        _newAge
      )
    );
    require(success, "failed");
  }

  function callReceiveMoney(address _demo) external payable {
    (bool success,) = _demo.call{value: msg.value}( // {value:...} нужно для пробрасывая денег дальше в слудющий контракт
      abi.encodeWithSignature(
        "receiveMoney(address)", // переводит деньги на контракт Demo
        msg.sender
      )
    );
    require(success, "failed");
  }

  function callFakeFunction(address _demo) external payable {
    (bool success,) = _demo.call{value: msg.value}(
      abi.encodeWithSignature(
        "fake(address)", // переводит деньги на контракт Demo, даже с учетом того,
        msg.sender       // что такой функции нет в Demo, зато есть функция 
      )                  // fallback, которая принимает на себя любые отправленные деньги
    );
    require(success, "failed");
  }
}
