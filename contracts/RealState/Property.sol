// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Property {
    address public realState;
    address public broker;
    address public currentOwner;

    uint256 public price;
    uint256 public commission;
    uint256 public timeToPay;

    mapping(address buyer => bool approved) public _approvedBuyers;
    mapping(address recipient => uint256 value) public _balances;

    constructor(
        address _realState,
        address _broker,
        address _currentOwner,
        uint256 _price,
        uint256 _commission,
        uint256 _timeToPay
    ) {
        realState = _realState;
        broker = _broker;
        currentOwner = _currentOwner;
        price = _price;
        commission = _commission;
        timeToPay = _timeToPay;
    }

    function purchase() external payable {
        require(_approvedBuyers[msg.sender] == true, "You are not approved to purchase");
        require(msg.value == price, "The price is incorrect");

        _balances[currentOwner] += msg.value - brokerCommission();
        _balances[broker] += brokerCommission();
        _approvedBuyers[msg.sender] = false;
        currentOwner = msg.sender;
    }

    function approveSaleFor(address _buyer) onlyBroker external {
        require(_buyer != currentOwner, "Current owner cannot be approved as a buyer");
        _approvedBuyers[_buyer] = true;
    }

    function removeSalesApprovalFrom(address _buyer) onlyBroker external {
        _approvedBuyers[_buyer] = false;
    }

    function brokerCommission() private view returns (uint256) {
        uint256 baseCommission = (price * commission) / 100;

        if (timeToPay >= block.timestamp) {
            baseCommission = baseCommission * 2;                
        }

        return baseCommission;
    }

    modifier onlyBroker() {
        require(msg.sender == broker, "Restricted to broker");
        _;
    }
}
