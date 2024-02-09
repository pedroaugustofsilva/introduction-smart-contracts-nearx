// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IProperty.sol";

contract Property is IProperty {
    address public realState;
    address public broker;
    address private currentOwner;

    uint256 public price;
    uint256 private commission;
    uint256 private timeDoubleCommission;

    mapping(address buyer => bool approved) private _approvedBuyers;
    mapping(address recipient => uint256 value) private _balances;

    constructor(
        address _realState,
        address _broker,
        address _currentOwner,
        uint256 _price,
        uint256 _commission,
        uint256 _timeDoubleCommission
    ) {
        realState = _realState;
        broker = _broker;
        currentOwner = _currentOwner;
        price = _price;
        commission = _commission;
        timeDoubleCommission = _timeDoubleCommission;
    }

    function purchase() external payable {
        require(_approvedBuyers[msg.sender] == true, "You are not approved to purchase");
        require(msg.value == price, "The price is incorrect");

        _balances[currentOwner] += msg.value - brokerCommission();
        _balances[broker] += brokerCommission();
        _approvedBuyers[msg.sender] = false;
        currentOwner = msg.sender;

        emit PropertyPurchased(msg.sender, price);
    }

    function approveSaleFor(address _buyer) onlyBroker external {
        require(_buyer != currentOwner, "Current owner cannot be approved as a buyer");
        _approvedBuyers[_buyer] = true;
    }

    function removeSalesApprovalFrom(address _buyer) onlyBroker external {
        _approvedBuyers[_buyer] = false;
    }
    
    function withdraw() external {
        require(_balances[msg.sender] > 0, "There is no value to withdraw");

        uint256 amount = _balances[msg.sender];
        _balances[msg.sender] = 0;
  
        payable(msg.sender).transfer(amount);
    }

    function brokerCommission() private view returns (uint256) {
        uint256 baseCommission = (price * commission) / 100;

        if (timeDoubleCommission >= block.timestamp) {
            baseCommission = baseCommission * 2;                
        }

        return baseCommission;
    }

    modifier onlyBroker() {
        require(msg.sender == broker, "Restricted to broker");
        _;
    }
}
