pragma solidity ^0.4.15;
import "Patient.sol";
contract Master {
  mapping(bytes32 => address) functions;

  event()

  function uploadData(bytes32 indexHash, bytes32 ipfsHash) public {
    //frontend?
  }

  function hashFinger(uint finger) public returns(bytes32) {
    return sha256(finger);
  }

  function toBytes(uint256 x) public returns (bytes b) {
    b = new bytes(32);
    assembly { mstore(add(b, 32), x) }
  }

  function makeFunction(bytes32 thumbHash, bytes32 indexHash, bytes32 ipfsHash) public {
    bytes memory inputs;
    bytes memory hashTime = sha3(now);
    for(uint i = 0; i < 64; i += 1) {
      //before i get safemath let me just try this
      inputs[i] = toBytes(uint(thumbHash[i]) - uint(ipfsHash[i])) ;
      }
    if (functions[indexHash] != address(0x0)) {
      functions[indexHash].call(bytes4(sha3("returnHash(bytes32)")),thumbHash);
    } else {
      functions[indexHash] = address(new Patient(inputs));
    }

  }

  function accessData(uint32 indexFinger, uint32 thumb) public {
    bytes32 memory indexHash = sha256(indexFinger);
    bytes32 memory thumbHash = sha256(thumb);
    return functions[indexHash].call(bytes4(sha3("returnHash(bytes32)")),thumbHash);
  }



}
