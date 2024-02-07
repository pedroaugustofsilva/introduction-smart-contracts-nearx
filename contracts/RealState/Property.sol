// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Property {
    address public realState;
    address public broker;
    address public currentOwner;

    uint256 public price;
    uint256 public comission;
    uint256 public timeToPay;

    mapping(address client => bool approved) public approvedClients;

    constructor(
        address _realState,
        address _broker,
        address _currentOwner,
        uint256 _price,
        uint256 _comission,
        uint256 _timeToPay
    ) {
        realState = _realState;
        broker = _broker;
        currentOwner = _currentOwner;
        price = _price;
        comission = _comission;
        timeToPay = _timeToPay;
    }

    function approveSaleFor(address _client) onlyBroker external {
        approvedClients[_client] = true;
    }

    function removeSalesApprovalFrom(address _client) onlyBroker external {
        approvedClients[_client] = false;
    }

    modifier onlyBroker() {
        require(msg.sender == broker, "Restricted to broker");
        _;
    }
}
