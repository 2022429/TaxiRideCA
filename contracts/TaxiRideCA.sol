// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TaxiRideCA {

    address public passenger;
    address payable public driver;
    uint public rideCost;
    bool public rideCompleted;
}