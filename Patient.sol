pragma solidity ^0.4.15;

contract Patient {
  address myAddress;
  uint num_updates;
  bytes32 functionInputs;
  mapping(address => uint);

  event InfoChanged(address);

  function Patient(bytes32 _functionInputs, address pcp) public {
    functionInputs = _functionInputs;
    infoChanged
  }

  function toBytes(uint256 x) public returns (bytes b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
  }

  function returnHash(bytes32 thumbHash) public returns (bytes) {
    bytes memory output;
    for (uint i = 0; i < 64; i += 1) {
      uint a = uint(thumbHash[i]);
      uint b = uint(functionInputs[i]);
      if (a > b) {
        output[i] = bytes1(toBytes(a - b));
      } else {
        output[i] = bytes1(toBytes(b - a));
      }
    }
    return output;
  }

  function updateInfo(bytes input, address pcp) {

  }
}
