// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalWaves;

    //create a struct that holds data about each wave
    struct Wave{
        address senderAddress;
        uint256 timeStamp;
        string message;
    }

    //create an array of Waves
    Wave[] waves;

    //define an event
    event WaveMe(address indexed from, uint256 timeStamp, string message);

    //must always have constructor before defining functions for a contract
    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    //create a function that emits the event
    function wave(string memory _message) public{
        totalWaves += 1;
        
        console.log("%s has waved at you!", msg.sender);

        waves.push(Wave(msg.sender, block.timestamp, _message)); 

        emit WaveMe(msg.sender, block.timestamp, _message);

    }

    function getAllWaves() public view returns (Wave[] memory){
        return waves;
    }

    function getTotalWaves() public view returns (uint256){
        console.log("We have a total of %d waves", totalWaves);
        return totalWaves;
    }
    
}