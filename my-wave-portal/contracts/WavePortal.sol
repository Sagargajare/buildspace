pragma solidity ^0.8.4;
// SPDX-License-Identifier: UNLICENSED
import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] allSenders;

    event NewWave(address indexed from,uint256 timestamp, string message);

    struct Wave {
        address from;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        allSenders.push(msg.sender);
        console.log("%s has waved!", msg.sender);
        waves.push(Wave(msg.sender,_message,block.timestamp));

        emit NewWave(msg.sender,block.timestamp,_message);

    }

    function getAllWaves() public view returns(Wave[] memory){
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllSendersAddress() public view returns (address[] memory) {
        return allSenders;
    }
}
