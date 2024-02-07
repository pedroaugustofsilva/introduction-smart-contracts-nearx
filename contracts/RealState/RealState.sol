// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IRealState.sol";
import "./Property.sol";

contract RealState is IRealState {
    Property[] public properties;

    function newProperty(
        address _broker,
        address _owner,
        uint256 _price,
        uint256 _comission,
        uint256 _timeToPay
    ) external returns (uint256 index) {
        Property property = new Property(address(this), _broker, _owner, _price, _comission, _timeToPay);
        properties.push(property);
        index = properties.length - 1;
    }
}
