pragma solidity ^0.8.4;
// SPDX-License-Identifier: UNLICENSED
import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] allSenders;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        allSenders.push(msg.sender);
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllSendersAddress() public view returns (address[] memory) {
        return allSenders;
    }
}
