// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Property.sol";

interface IRealState {
    function newProperty(
        address _broker,
        address _owner,
        uint256 _price,
        uint256 _comission,
        uint256 _timeToPay
    ) external returns (address);
}
