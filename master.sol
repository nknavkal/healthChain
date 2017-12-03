pragma solidity ^0.4.15;
import "patientAbstract.sol"
contract master {
  patientAbstract patient
  mapping(bytes32 => address) functions;




  function uploadData(bytes32 indexHash, bytes32 ipfsHash) {
    //frontend?
  }

  function hashFinger(uint finger) returns(bytes32){
    return sha256(finger);
  }

  function makeFunction(bytes32 thumbHash, bytes32 ipfsHash) {
    patient = new patientAbstract;
    
  }

}
