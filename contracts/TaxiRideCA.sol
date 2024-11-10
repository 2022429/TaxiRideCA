// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TaxiRideCA {

//Defining the roles 
    address public passenger;    //Passanger
    address payable public driver;    //Driver
    uint public rideCost;   //cost of the ride
    bool public rideCompleted;   
}