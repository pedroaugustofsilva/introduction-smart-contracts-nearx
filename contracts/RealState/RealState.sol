// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IRealState.sol";
import "./Property.sol";

contract RealState is IRealState {
    address public owner;
    Property[] public properties;

    constructor() {
        owner = msg.sender;
    }

    function newProperty(
        address _broker,
        address _propertyOwner,
        uint256 _price,
        uint256 _comission,
        uint256 _timeToPay
    ) onlyOwner external returns (uint256 index) {
        Property property = new Property(address(this), _broker, _propertyOwner, _price, _comission, _timeToPay);
        properties.push(property);
        index = properties.length - 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Restricted to contract owner");
        _;
    }
}
