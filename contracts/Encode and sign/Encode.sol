// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* В этом контракте фнукция doEnc конвертирует входные данные в байтовые массивы, 
а фнукция doHash хэширует эти байтовые массивы.
    Важно:
При предаче “John”, “Doe” и “Joh”, “nDoe”:
encode вернет два разных хэша
encodePacked вернет два одинаковых хэша (коллизия) 
*/

Contract Demo {

  function doEnc(string memory str1, string memory str2) public pure returns (bytes memory) {
    bytes memory res1 = abi.encode(str1, str2); 
    bytes memory res2 = abi.encodePacked(str1, str2);
    return (res1, res2);
  }

  function doHash(string memory str1, string memory str2) public pure returns(bytes32) {
    return keccak256(doEnc(str1, str2)) 
  }
}
