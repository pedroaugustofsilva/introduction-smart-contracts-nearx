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
        uint256 _commission,
        uint256 _timeDoubleCommission
    ) onlyOwner external returns (address propertyAddress) {
        Property property = new Property(address(this), _broker, _propertyOwner, _price, _commission, _timeDoubleCommission);
        properties.push(property);
        propertyAddress = address(property); 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Restricted to contract owner");
        _;
    }
}
