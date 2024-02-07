// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Property {
    address public realState;
    address public broker;
    address public owner;

    uint256 public price;
    uint256 public comission;
    uint256 public timeToPay;

    constructor(
        address _realState,
        address _broker,
        address _owner,
        uint256 _price,
        uint256 _comission,
        uint256 _timeToPay
    ) {
        realState = _realState;
        broker = _broker;
        owner = _owner;
        price = _price;
        comission = _comission;
        timeToPay = _timeToPay;
    }
}
