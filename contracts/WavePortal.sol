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

        //emits the event
        emit WaveMe(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;

        //a keyword to check whether something is true. 
        //a fancy if statement
        require(
            prizeAmount <= address(this).balance;
            "Trying out withdraw more money than the contract has."
        );

        //send money to the waver
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        //
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllWaves() public view returns (Wave[] memory){
        return waves;
    }

    function getTotalWaves() public view returns (uint256){
        console.log("We have a total of %d waves", totalWaves);
        return totalWaves;
    }
    
}